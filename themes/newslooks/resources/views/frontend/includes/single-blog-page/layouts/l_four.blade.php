<div class="container">
    <div class="row">
        <div class="col-12">
            <!-- Post Title Wrap -->
            <div class="post-title--wrap bg-light--two radius-3 mb-20">
                @include('theme/newslooks::frontend.includes.single-blog-page.post-title', [
                    'blog' => $blog,
                    'single_blog_page' => $single_blog_page,
                ])
            </div>
            <!-- End Post Title Wrap -->
        </div>
    </div>
</div>
