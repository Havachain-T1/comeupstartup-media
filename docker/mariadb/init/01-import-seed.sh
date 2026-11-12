#!/bin/bash
# Runs once, on first start of an empty MariaDB volume.
# Imports the sanitised development seed into the app DB and the test DB.
set -euo pipefail

TEST_DB="${DB_TEST_DATABASE:-comeupstartup_test}"

for db in "${MYSQL_DATABASE}" "${TEST_DB}"; do
    echo "Importing /seed/data.sql into ${db}"
    mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" <<SQL
CREATE DATABASE IF NOT EXISTS \`${db}\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON \`${db}\`.* TO '${MYSQL_USER}'@'%';
FLUSH PRIVILEGES;
SQL
    mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" "${db}" < /seed/data.sql
done
