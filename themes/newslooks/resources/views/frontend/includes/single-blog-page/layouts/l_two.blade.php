<div class="container">
    <div class="row">
        <div class="col-12 pb-rs-60">
            <!-- Feature Image Wrap -->
            <div class="feature-img--wrap meta-on--img">
                @include('theme/newslooks::frontend.includes.single-blog-page.post-meta', [
                    'blog' => $blog,
                    'single_blog_page' => $single_blog_page,
                ])
            </div>
            <!-- End Feature Image Wrap -->
        </div>
    </div>
</div>
