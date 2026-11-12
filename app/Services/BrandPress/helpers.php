<?php

if (!function_exists('clean_press_html')) {
    /** Allow-list sanitiser for company-submitted copy before it is published as an article. */
    function clean_press_html(string $html): string
    {
        $html = preg_replace('#<(script|style|iframe|object|embed|form)[^>]*>.*?</\1>#is', '', $html);
        $html = strip_tags($html, '<p><br><strong><b><em><i><ul><ol><li><a><h2><h3><h4><blockquote>');
        $html = preg_replace('/\s+on[a-z]+\s*=\s*("[^"]*"|\'[^\']*\'|[^\s>]+)/i', '', $html);
        $html = preg_replace('/(href)\s*=\s*("|\')\s*(javascript|data|vbscript):[^"\']*\2/i', '$1="#"', $html);
        $html = preg_replace('/\s(style|class|id)\s*=\s*("[^"]*"|\'[^\']*\')/i', '', $html);

        return $html;
    }
}
