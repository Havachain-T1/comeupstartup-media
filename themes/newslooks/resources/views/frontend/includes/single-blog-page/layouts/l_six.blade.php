<div class="container mb-20">
    <div class="row">
        <div class="col-12">
            <div class="post-title--wrap bg-light--two radius-3">
                @include('theme/newslooks::frontend.includes.single-blog-page.post-title', [
                    'blog' => $blog,
                    'single_blog_page' => $single_blog_page,
                ])
            </div>
        </div>
        <!-- End Post Title Wrap -->
    </div>
</div>
</div>

<!-- Feature Image Wrap -->
<div class="feature-img--wrap meta-on--img mb-rs-60">
    @include('theme/newslooks::frontend.includes.single-blog-page.post-meta', [
        'blog' => $blog,
        'single_blog_page' => $single_blog_page,
    ])
</div>
<!-- End Feature Image Wrap -->
