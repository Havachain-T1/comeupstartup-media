<!-- Feature Image Wrap -->
<div class="feature-img--wrap meta-on--img mb-rs-60">
    @include('theme/newslooks::frontend.includes.single-blog-page.post-meta', [
        'blog' => $blog,
        'single_blog_page' => $single_blog_page,
    ])

    <!-- Post Meta -->
    <ul class="nav align-items-center feature-img--meta">
        @if (isset($single_blog_page['blog_share']) && $single_blog_page['blog_share'] == 1)
            <li>
                <div class="nav post-share align-items-center">
                    <span>{{ front_translate('Share') }}:</span>
                    @include('theme/newslooks::frontend.includes.blog-share', [
                        'blog_shares' => $blog_shares,
                    ])
                </div>
            </li>
        @endif
    </ul>
    <!-- End Post Meta -->
</div>
<!-- End Feature Image Wrap -->

<!-- Post Title Wrap -->
<div class="post-title--wrap p-0 mb-30">
    @include('theme/newslooks::frontend.includes.single-blog-page.post-title', [
        'blog' => $blog,
        'single_blog_page' => $single_blog_page,
    ])
</div>
<!-- End Post Title Wrap -->
