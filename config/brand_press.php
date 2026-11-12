<?php

return [
    'product_code' => 'brand-press',
    // Optional tl_users id used as the byline for published releases; defaults to the approving editor.
    'author_user_id' => env('BRAND_PRESS_AUTHOR_ID'),
    'disclosure' => 'This is a paid press release submitted by :company. ComeUpStartup Media reviewed it for editorial standards but does not endorse its claims.',
];
