<?php

namespace App\Services\AI;

use Illuminate\Support\Facades\DB;

class PromptRepository
{
    /** Highest active version for the key; seeds the shipped default on first use. */
    public function active(string $key): object
    {
        $default = config('ai_prompts')[$key] ?? null; // keys contain dots, so no dot-notation lookup
        if ($default && !DB::table('ai_prompts')->where('key', $key)->where('version', $default['version'])->exists()) {
            DB::table('ai_prompts')->insertOrIgnore(['key' => $key, 'version' => $default['version'], 'system' => $default['system'], 'template' => $default['template'], 'is_active' => true, 'created_at' => now(), 'updated_at' => now()]);
        }
        $prompt = DB::table('ai_prompts')->where('key', $key)->where('is_active', true)->orderByDesc('version')->first();
        if (!$prompt) {
            throw new AiException("Unknown prompt [$key].", AiException::UNAVAILABLE);
        }

        return $prompt;
    }

    public function render(string $template, array $variables, int $maxChars): string
    {
        return preg_replace_callback('/\{\{\s*(\w+)\s*\}\}/', fn ($m) => mb_substr(trim((string) ($variables[$m[1]] ?? '')), 0, $maxChars), $template);
    }
}
