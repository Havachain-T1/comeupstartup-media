{{-- Single Blog Page Header --}}
<h3 class="black mb-3">{{ translate('Single Post Page') }}</h3>
<input type="hidden" name="option_name" value="single_blog_page">

{{-- Single Blog Page Layout Field Start --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Layout') }}
        </label>
        <span class="d-block">{{ translate('Choose post single page layout from here.') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1 row">
        <select class="form-control select" name="single_blog_layout" id="single_blog_layout">
            <option value="l_one"
                {{ isset($option_settings['single_blog_layout']) && $option_settings['single_blog_layout'] == 'l_one' ? 'selected' : '' }}>
                Layout One</option>
            <option value="l_two"
                {{ isset($option_settings['single_blog_layout']) && $option_settings['single_blog_layout'] == 'l_two' ? 'selected' : '' }}>
                Layout Two</option>
            <option value="l_three"
                {{ isset($option_settings['single_blog_layout']) && $option_settings['single_blog_layout'] == 'l_three' ? 'selected' : '' }}>
                Layout Three</option>
            <option value="l_four"
                {{ isset($option_settings['single_blog_layout']) && $option_settings['single_blog_layout'] == 'l_four' ? 'selected' : '' }}>
                Layout Four</option>
            <option value="l_five"
                {{ isset($option_settings['single_blog_layout']) && $option_settings['single_blog_layout'] == 'l_five' ? 'selected' : '' }}>
                Layout Five</option>
            <option value="l_six"
                {{ isset($option_settings['single_blog_layout']) && $option_settings['single_blog_layout'] == 'l_six' ? 'selected' : '' }}>
                Layout Six
            </option>
            <option value="l_seven"
                {{ isset($option_settings['single_blog_layout']) && $option_settings['single_blog_layout'] == 'l_seven' ? 'selected' : '' }}>
                Layout Seven
            </option>
        </select>
    </div>
</div>
{{-- Single Blog Page Layout Field End --}}

{{-- Blog Post Author Show/Hide Field Start --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Author') }}
        </label>
        <span class="d-block">{{ translate('Switch On to Display Author.') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <label class="switch success">
            <input type="hidden" name="author" value="0">
            <input type="checkbox"
                {{ isset($option_settings['author']) && $option_settings['author'] == 1 ? 'checked' : '' }}
                name="author" id="author" value="1">
            <span class="control" id="author_switch">
                <span class="switch-off">{{ translate('Disable') }}</span>
                <span class="switch-on">{{ translate('Enable') }}</span>
            </span>
        </label>
    </div>
</div>
{{-- Blog Post Author Show/Hide Field End --}}

{{-- Blog Post Date Show/Hide Field Start --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Date') }}
        </label>
        <span class="d-block">{{ translate('Switch On to Display Date.') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <label class="switch success">
            <input type="hidden" name="date" value="0">
            <input type="checkbox"
                {{ isset($option_settings['date']) && $option_settings['date'] == 1 ? 'checked' : '' }} name="date"
                id="date" value="1">
            <span class="control" id="date_switch">
                <span class="switch-off">{{ translate('Disable') }}</span>
                <span class="switch-on">{{ translate('Enable') }}</span>
            </span>
        </label>
    </div>
</div>
{{-- Blog Post Date Show/Hide Field Start --}}

{{-- Blog Post Reading Time Show/Hide Field Start --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Views Count') }}
        </label>
        <span class="d-block">{{ translate('Switch On to Display Total Views.') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <label class="switch success">
            <input type="hidden" name="views" value="0">
            <input type="checkbox"
                {{ isset($option_settings['views']) && $option_settings['views'] == 1 ? 'checked' : '' }}
                name="views" id="views" value="1">
            <span class="control" id="views_switch">
                <span class="switch-off">{{ translate('Disable') }}</span>
                <span class="switch-on">{{ translate('Enable') }}</span>
            </span>
        </label>
    </div>
</div>
{{-- Blog Post Reading Time Show/Hide Field Start --}}

{{-- Blog Post Category Show/Hide Field Start --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Category') }}
        </label>
        <span class="d-block">{{ translate('Switch On to Display Category.') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <label class="switch success">
            <input type="hidden" name="category" value="0">
            <input type="checkbox"
                {{ isset($option_settings['category']) && $option_settings['category'] == 1 ? 'checked' : '' }}
                name="category" id="category" value="1">
            <span class="control" id="category_switch">
                <span class="switch-off">{{ translate('Disable') }}</span>
                <span class="switch-on">{{ translate('Enable') }}</span>
            </span>
        </label>
    </div>
</div>
{{-- Blog Post Category Show/Hide Field Start --}}

{{-- Blog Post Tags Show/Hide Field Start --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Tags') }}
        </label>
        <span class="d-block">{{ translate('Switch On to Display Tags.') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <label class="switch success">
            <input type="hidden" name="tags" value="0">
            <input type="checkbox"
                {{ isset($option_settings['tags']) && $option_settings['tags'] == 1 ? 'checked' : '' }} name="tags"
                id="tags" value="1">
            <span class="control" id="tags_switch">
                <span class="switch-off">{{ translate('Disable') }}</span>
                <span class="switch-on">{{ translate('Enable') }}</span>
            </span>
        </label>
    </div>
</div>
{{-- Blog Post Tags Show/Hide Field Start --}}

{{-- Blog Post Comments Show/Hide Field Start --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Comments') }}
        </label>
        <span class="d-block">{{ translate('Switch On to Display Comments.') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <label class="switch success">
            <input type="hidden" name="comments" value="0">
            <input type="checkbox"
                {{ isset($option_settings['comments']) && $option_settings['comments'] == 1 ? 'checked' : '' }}
                name="comments" id="comments" value="1">
            <span class="control" id="comments_switch">
                <span class="switch-off">{{ translate('Disable') }}</span>
                <span class="switch-on">{{ translate('Enable') }}</span>
            </span>
        </label>
    </div>
</div>
{{-- Blog Post Comments Show/Hide Field Start --}}

{{-- Blog Post Share Show/Hide Field Start --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Post Share Options') }}
        </label>
        <span class="d-block">{{ translate('Switch On to Display Blog Share.') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <label class="switch success">
            <input type="hidden" name="blog_share" value="0">
            <input type="checkbox"
                {{ isset($option_settings['blog_share']) && $option_settings['blog_share'] == 1 ? 'checked' : '' }}
                name="blog_share" id="blog_share" value="1">
            <span class="control" id="blog_share_switch">
                <span class="switch-off">{{ translate('Disable') }}</span>
                <span class="switch-on">{{ translate('Enable') }}</span>
            </span>
        </label>
    </div>
</div>
{{-- Blog Post Share Show/Hide Field Start --}}

{{-- Blog Post Biography Info Show/Hide Field Start --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Biography Info') }}
        </label>
        <span
            class="d-block">{{ translate('Control biography info from here. If you use this option then you will able to show ro hide biography info') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <label class="switch success">
            <input type="hidden" name="biography_info" value="0">
            <input type="checkbox"
                {{ isset($option_settings['biography_info']) && $option_settings['biography_info'] == 1 ? 'checked' : '' }}
                name="biography_info" id="biography_info" value="1">
            <span class="control" id="biography_info_switch">
                <span class="switch-off">{{ translate('Hide') }}</span>
                <span class="switch-on">{{ translate('Show') }}</span>
            </span>
        </label>
    </div>
</div>
{{-- Blog Post Biography Info Show/Hide Field Start --}}

{{-- Blog Post Prev/Next Navbar Show/Hide Field Start --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Post Prev/Next Nav') }}
        </label>
        <span class="d-block">{{ translate('Control Post Previous Post and Next Post Navbar') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <label class="switch success">
            <input type="hidden" name="post_navigation" value="0">
            <input type="checkbox"
                {{ isset($option_settings['post_navigation']) && $option_settings['post_navigation'] == 1 ? 'checked' : '' }}
                name="post_navigation" id="post_navigation" value="1">
            <span class="control" id="post_navigation_switch">
                <span class="switch-off">{{ translate('Hide') }}</span>
                <span class="switch-on">{{ translate('Show') }}</span>
            </span>
        </label>
    </div>
</div>
{{-- Blog Post Prev/Next Navbar Show/Hide Field Start --}}

{{-- Related Blog Show/Hide Field Start --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Related Posts') }}
        </label>
        <span class="d-block">{{ translate('Show/Hide related posts') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <label class="switch success">
            <input type="hidden" name="related_blogs" value="0">
            <input type="checkbox"
                {{ isset($option_settings['related_blogs']) && $option_settings['related_blogs'] == 1 ? 'checked' : '' }}
                name="related_blogs" id="related_blogs" value="1">
            <span class="control" id="related_blogs_switch">
                <span class="switch-off">{{ translate('Hide') }}</span>
                <span class="switch-on">{{ translate('Show') }}</span>
            </span>
        </label>
    </div>
</div>
{{-- Related Blog Show/Hide Field Start --}}

<!-- Related Blog Section Title  -->
<div class="form-group row py-4 border-bottom" id="related_blogs_switch_on_field">
    <div class="col-xl-5">
        <label for="related_section_title" class="font-16 bold black">{{ translate('Related Post Section Title') }}
        </label>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <input type="text" name="related_section_title" id="related_section_title" class="form-control"
            placeholder="{{ translate('Related Post Section Title') }}"
            value="{{ isset($option_settings['related_section_title']) ? $option_settings['related_section_title'] : '' }}">
        <small>{{ translate('Transalate to another language') }} <a
                href="{{ route('core.languages') }}">{{ translate('click here') }}.</a></small>
    </div>
</div>

{{-- Popular Blog Show/Hide Field Start --}}
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Popular Posts') }}
        </label>
        <span class="d-block">{{ translate('Show/Hide Popular post') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <label class="switch success">
            <input type="hidden" name="popular_blogs" value="0">
            <input type="checkbox"
                {{ isset($option_settings['popular_blogs']) && $option_settings['popular_blogs'] == 1 ? 'checked' : '' }}
                name="popular_blogs" id="popular_blogs" value="1">
            <span class="control" id="popular_blogs_switch">
                <span class="switch-off">{{ translate('Hide') }}</span>
                <span class="switch-on">{{ translate('Show') }}</span>
            </span>
        </label>
    </div>
</div>
{{-- Popular Blog Show/Hide Field Start --}}

<!-- Popular Blog Section Title  -->
<div class="form-group row py-4 border-bottom" id="popular_blogs_switch_on_field">
    <div class="col-xl-5">
        <label for="popular_section_title" class="font-16 bold black">{{ translate('Popular Post Section Title') }}
        </label>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <input type="text" name="popular_section_title" id="popular_section_title" class="form-control"
            placeholder="{{ translate('Popular Post Section Title') }}"
            value="{{ isset($option_settings['popular_section_title']) ? $option_settings['popular_section_title'] : '' }}">
        <small>{{ translate('Transalate to another language') }} <a
                href="{{ route('core.languages') }}">{{ translate('click here') }}.</a></small>
    </div>
</div>
