<?php

namespace App\Services\Search;

use Illuminate\Support\Str;

final class SearchQuery
{
    /** InnoDB ignores tokens shorter than innodb_ft_min_token_size (3 by default). */
    public const MIN_FULLTEXT_TOKEN = 3;

    public readonly string $raw;
    public readonly string $normalized;
    /** @var string[] */
    public readonly array $tokens;

    public function __construct(string $raw, int $maxLength = 100)
    {
        $this->raw = $raw;
        $text = Str::lower(Str::limit(trim($raw), $maxLength, ''));
        $text = preg_replace('/[^\p{L}\p{N}\s\'-]+/u', ' ', $text) ?? '';
        $text = trim(preg_replace('/\s+/u', ' ', $text) ?? '');
        $this->normalized = $text;
        $this->tokens = array_values(array_filter(
            preg_split('/[\s\'-]+/u', $text) ?: [],
            fn ($t) => $t !== ''
        ));
    }

    public function length(): int
    {
        return mb_strlen($this->normalized);
    }

    /** Boolean-mode expression requiring every indexable token, with prefix matching. */
    public function booleanExpression(): ?string
    {
        $terms = array_filter($this->tokens, fn ($t) => mb_strlen($t) >= self::MIN_FULLTEXT_TOKEN);

        return $terms ? implode(' ', array_map(fn ($t) => '+' . $t . '*', $terms)) : null;
    }

    public function likePattern(): string
    {
        return '%' . addcslashes($this->normalized, '%_\\') . '%';
    }

    public function prefixPatterns(): array
    {
        $escaped = addcslashes($this->normalized, '%_\\');

        return [$escaped . '%', '% ' . $escaped . '%'];
    }
}
