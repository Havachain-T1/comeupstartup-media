#!/usr/bin/env python3
"""Sanitise the development SQL seed (database/data.sql) in place.

Keeps every table definition, index, constraint and row id. Only replaces
credentials and personal data with development-only values:

  * open_ai_settings.api_key                         -> NULL
  * tl_theme_option_settings mailchimp_api_key/list_id -> ''
  * tl_users.password                               -> bcrypt("password") (dev only)
  * password_resets rows (stale reset tokens)        -> removed
  * tl_blog_comments IP addresses                    -> 192.0.2.0/24 (RFC 5737)
  * e-mail addresses outside example.com/.test       -> <local>@example.test

Idempotent: running it again produces the same file.
Usage: python3 tools/sanitise-seed.py [path/to/data.sql]
"""
import re
import sys

DEV_PASSWORD_HASH = "$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi"  # "password"
BANNER = (
    "-- SANITISED DEVELOPMENT SEED - NOT PRODUCTION DATA.\n"
    "-- Vendor demo content (NewsLooks/ThemeLooks). Credentials and personal data were\n"
    "-- replaced by tools/sanitise-seed.py. Every seeded user's password is: password\n"
)


def insert_block(sql, table):
    start = sql.find("INSERT INTO `%s` " % table)
    if start < 0:
        return None
    end = sql.find(";\n", start) + 2
    return start, end


def edit_block(sql, table, fn):
    span = insert_block(sql, table)
    if span is None:
        return sql
    start, end = span
    return sql[:start] + fn(sql[start:end]) + sql[end:]


def main(path):
    sql = open(path, encoding="utf-8").read()

    sql = edit_block(sql, "open_ai_settings",
                     lambda b: re.sub(r"\((\d+), '[^']*',", r"(\1, NULL,", b))

    sql = edit_block(sql, "tl_theme_option_settings",
                     lambda b: re.sub(r"('(?:mailchimp_api_key|mailchimp_list_id)', )'[^']*'", r"\1''", b))

    sql = edit_block(sql, "tl_users",
                     lambda b: re.sub(r"'\$2y\$\d\d\$[./A-Za-z0-9]{53}'", "'%s'" % DEV_PASSWORD_HASH, b))

    span = insert_block(sql, "password_resets")
    if span is not None:
        sql = sql[:span[0]] + sql[span[1]:]

    counter = iter(range(1, 10_000))
    sql = edit_block(sql, "tl_blog_comments",
                     lambda b: re.sub(r"'(?:\d{1,3}\.){3}\d{1,3}'",
                                      lambda m: "'192.0.2.%d'" % (next(counter) % 254 + 1), b))

    def remap_email(m):
        local, domain = m.group(1), m.group(2).lower()
        if domain in ("example.com", "example.test"):
            return m.group(0)
        return "%s@example.test" % local

    sql = re.sub(r"([A-Za-z0-9._%+-]+)@([A-Za-z0-9-]+(?:\.[A-Za-z0-9-]+)*\.[A-Za-z]{2,})", remap_email, sql)

    if not sql.startswith(BANNER):
        sql = BANNER + sql

    open(path, "w", encoding="utf-8").write(sql)


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "database/data.sql")
