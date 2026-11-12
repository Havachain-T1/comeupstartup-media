<div class="container">
    <div class="row">
        <div class="col-12 pb-rs-60">
            <!-- Feature Image Wrap -->
            <div class="feature-img--wrap ">
                <!-- Post Item -->
                <div class="post--item bg-img-style feature-img post-white bg-overlay post-layout-3">
                    <!-- Image -->
                    @include('theme/newslooks::frontend.includes.single-blog-page.post-meta', [
                        'blog' => $blog,
                        'single_blog_page' => $single_blog_page,
                    ])
                    <!-- End Image -->

                    <!-- Post Content -->
                    <div class="post--content">
                        @include('theme/newslooks::frontend.includes.single-blog-page.post-title', [
                            'blog' => $blog,
                            'single_blog_page' => $single_blog_page,
                        ])
                    </div>
                    <!-- End Post Content -->
                </div>
                <!-- End Post Item -->
            </div>
            <!-- End Feature Image Wrap -->
        </div>
    </div>
</div>
