<!-- Blog Header -->
<h3 class="black mb-3">{{ translate('Post') }}</h3>
<input type="hidden" name="option_name" value="blog">

<!-- Blog Layout Field Start -->
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Layout') }}
        </label>
        <span
            class="d-block">{{ translate('Choose post layout from here. If you use this option then you will able to change three type of blog layout ( Default Right Sidebar Layout ).') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1 row" id="blog_layout_image_field">
        <div class="col-4">
            <div class="input-group">
                <input type="radio" class="d-none"
                    {{ isset($option_settings['blog_layout']) && $option_settings['blog_layout'] == 'full_layout' ? 'checked' : '' }}
                    name="blog_layout" id="full_layout" value="full_layout">
                <label for="full_layout">
                    <img src="{{ asset('themes/newslooks/public/img/blog-layout/no-sideber.png') }}" title="no sidebar"
                        alt="no sidebar" class="layout_img">
                </label>
            </div>
        </div>
        <div class="col-4">
            <div class="input-group">
                <input type="radio"
                    {{ isset($option_settings['blog_layout']) && $option_settings['blog_layout'] == 'left_sidebar_layout' ? 'checked' : '' }}
                    class="d-none" name="blog_layout" id="left_sidebar_layout" value="left_sidebar_layout">
                <label for="left_sidebar_layout">
                    <img src="{{ asset('themes/newslooks/public/img/blog-layout/left-sideber.png') }}"
                        title="left sidebar layout" alt="left sidebar layout" class="layout_img">
                </label>
            </div>
        </div>
        <div class="col-4">
            <div class="input-group">
                <input type="radio"
                    {{ isset($option_settings['blog_layout']) && $option_settings['blog_layout'] == 'right_sidebar_layout' ? 'checked' : '' }}
                    class="d-none" name="blog_layout" id="right_sidebar_layout" value="right_sidebar_layout">
                <label for="right_sidebar_layout">
                    <img src="{{ asset('themes/newslooks/public/img/blog-layout/right-sideber.png') }}"
                        title="right sidebar layout" alt="right sidebar layout" class="layout_img">
                </label>
            </div>
        </div>
    </div>
</div>
<!-- Blog Layout Field End -->

<!-- Blog Column Field Start -->
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Post Column') }}
        </label>
        <span
            class="d-block">{{ translate('Select your post post column from here. If you use this option then you will able to select three type of blog colum layout ( Default One Column ).') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1 row" id="blog_colum_image_field">
        <div class="col-4">
            <div class="input-group">
                <input type="radio"
                    {{ isset($option_settings['blog_colum']) && $option_settings['blog_colum'] == 'col-lg-12' ? 'checked' : '' }}
                    class="d-none" name="blog_colum" id="blog_colum_1" value="col-lg-12">
                <label for="blog_colum_1">
                    <img src="{{ asset('themes/newslooks/public/img/blog-column/1column.png') }}" title="Post Column 1"
                        alt="Post Column 1" class="layout_img">
                </label>
            </div>
        </div>
        <div class="col-4">
            <div class="input-group">
                <input type="radio"
                    {{ isset($option_settings['blog_colum']) && $option_settings['blog_colum'] == 'col-md-6' ? 'checked' : '' }}
                    class="d-none" name="blog_colum" id="blog_colum_2" value="col-md-6">
                <label for="blog_colum_2">
                    <img src="{{ asset('themes/newslooks/public/img/blog-column/2column.png') }}" title="Post Column 2"
                        alt="Post Column 2" class="layout_img">
                </label>
            </div>
        </div>
        <div class="col-4">
            <div class="input-group">
                <input type="radio"
                    {{ isset($option_settings['blog_colum']) && $option_settings['blog_colum'] == 'col-md-4 col-sm-6' ? 'checked' : '' }}
                    class="d-none" name="blog_colum" id="blog_colum_3" value="col-md-4 col-sm-6">
                <label for="blog_colum_3">
                    <img src="{{ asset('themes/newslooks/public/img/blog-column/3column.png') }}" title="Post Column 3"
                        alt="Post Column 3" class="layout_img">
                </label>
            </div>
        </div>
    </div>
</div>
<!-- Blog Column Field End -->

<!-- Blog Post Style Field Start -->
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label for="back_to_top_button" class="font-16 bold black">{{ translate('Post Style') }}
        </label>
        <span class="d-block">{{ translate('Select Post Style.') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <select class="form-control select" name="blog_post_style" id="blog_post_style">
            <option value="s_one"
                {{ isset($option_settings['blog_post_style']) && $option_settings['blog_post_style'] == 's_one' ? 'selected' : '' }}
                data-image="s_one">Style One</option>
            <option value="s_two"
                {{ isset($option_settings['blog_post_style']) && $option_settings['blog_post_style'] == 's_two' ? 'selected' : '' }}
                data-image="s_two">Style Two</option>
            <option value="s_three"
                {{ isset($option_settings['blog_post_style']) && $option_settings['blog_post_style'] == 's_three' ? 'selected' : '' }}
                data-image="s_three">Style Three</option>
            <option value="s_four"
                {{ isset($option_settings['blog_post_style']) && $option_settings['blog_post_style'] == 's_four' ? 'selected' : '' }}
                data-image="s_four">Style Four</option>
            <option value="s_five"
                {{ isset($option_settings['blog_post_style']) && $option_settings['blog_post_style'] == 's_five' ? 'selected' : '' }}
                data-image="s_five">Style Five</option>
        </select>
    </div>
</div>
<!-- Style image -->
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-6 offset-xl-5">
        <img src="" id="blog_post_style_image">
    </div>
</div>
<!-- Blog Post Style Field End -->

<!-- Blog Post Excerpt Field Start -->
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Posts Excerpt') }}
        </label>
        <span
            class="d-block">{{ translate('Control the number of characters you want to show in the post page for each post.. If you use this option then you can able to control your post post characters from here.(default 50 character)') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1 row align-items-center">
        <input type="number" class="form-control col-xl-3" name="blog_posts_excerpt" id="blog_posts_excerpt"
            value="{{ isset($option_settings['blog_posts_excerpt']) ? $option_settings['blog_posts_excerpt'] : '0' }}">
        <input type="range" class="col-xl-8" id="blog_posts_excerpt_range" style="height: 30%;" min="0"
            max="200"
            value="{{ isset($option_settings['blog_posts_excerpt']) ? $option_settings['blog_posts_excerpt'] : '0' }}">
    </div>
</div>
<!-- Blog Post Excerpt Field End -->

<!-- Blog PerPage Field Start -->
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Post PerPage Number') }}
        </label>
        <span
            class="d-block">{{ translate('Control the number posts to show on each page ( Default show 10 ).') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1 row align-items-center">
        <input type="number" class="form-control col-xl-3" name="blog_perpage" id="blog_perpage"
            value="{{ isset($option_settings['blog_perpage']) ? $option_settings['blog_perpage'] : '0' }}">
        <input type="range" class="col-xl-8" id="blog_perpage_range" style="height: 30%;" min="0"
            max="100"
            value="{{ isset($option_settings['blog_perpage']) ? $option_settings['blog_perpage'] : '0' }}">
    </div>
</div>
<!-- Blog PerPage Field End -->

<!-- Blog Read More Text Setting Field Start -->
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Read More Text Setting') }}
        </label>
        <span class="d-block">{{ translate('Control read more text from here.') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <label class="switch success">
            <input type="hidden" name="read_more_text_setting" value="default">
            <input type="checkbox"
                {{ isset($option_settings['read_more_text_setting']) && $option_settings['read_more_text_setting'] == 'custom' ? 'checked' : '' }}
                name="read_more_text_setting" id="read_more_text_setting" value="custom">
            <span class="control" id="read_more_text_setting_switch">
                <span class="switch-off">{{ translate('Default') }}</span>
                <span class="switch-on">{{ translate('Custom') }}</span>
            </span>
        </label>
    </div>
</div>
<!-- Blog Read More Text Setting Field End -->

<!-- Blog Read More Text Setting Switch On Field Start -->
<div class="form-group row py-4 border-bottom" id="read_more_text_setting_switch_on_field">
    <div class="col-xl-5">
        <label for="read_more_text_setting" class="font-16 bold black">{{ translate('Read More Text') }}
        </label>
        <span
            class="d-block">{{ translate('Set read moer text here. If you use this option then you will able to set your won text.') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <input type="text" name="read_more_text" id="read_more_text" class="form-control"
            placeholder="{{ translate('Read More Text') }}"
            value="{{ isset($option_settings['read_more_text']) ? $option_settings['read_more_text'] : '' }}">
        <small>{{ translate('Transalate to another language') }} <a
                href="{{ route('core.languages') }}">{{ translate('click here') }}.</a></small>
    </div>
</div>
<!-- Blog Read More Text Setting Switch On Field End -->

<!-- Blog Pagination Settings Field Start -->
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Post Pagination Settings') }}
        </label>
        <span class="d-block">{{ translate('Set post pagination. Number Pagination or Link Pagination') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <label class="switch success">
            <input type="hidden" name="blog_pagination_setting" value="link">
            <input type="checkbox"
                {{ isset($option_settings['blog_pagination_setting']) && $option_settings['blog_pagination_setting'] == 'number' ? 'checked' : '' }}
                name="blog_pagination_setting" id="blog_pagination_setting" value="number">
            <span class="control" id="blog_pagination_setting_switch">
                <span class="switch-off">Link</span>
                <span class="switch-on">Number</span>
            </span>
        </label>
    </div>
</div>
<!-- Blog Pagination Settings Field End -->

<!-- Blog Pagination Number Settings Position Field Start -->
<div class="form-group row py-4 border-bottom">
    <div class="col-xl-5">
        <label class="font-16 bold black">{{ translate('Post Pagination Position') }}
        </label>
        <span class="d-block">{{ translate('Set post pagination Position.') }}</span>
    </div>
    <div class="col-xl-6 offset-xl-1">
        <div class="btn-group" data-toggle="buttons">
            <label class="btn btn-light sm">
                <input type="radio"
                    {{ isset($option_settings['blog_pagination_position']) && $option_settings['blog_pagination_position'] == 'start' ? 'checked' : '' }}
                    class="d-none" name="blog_pagination_position" id="left" value="start">
                {{ translate('left') }}
            </label>
            <label class="btn btn-light sm">
                <input type="radio"
                    {{ isset($option_settings['blog_pagination_position']) && $option_settings['blog_pagination_position'] == 'center' ? 'checked' : '' }}
                    class="d-none" name="blog_pagination_position" id="center" value="center">
                {{ translate('center') }}
            </label>
            <label class="btn btn-light sm">
                <input type="radio"
                    {{ isset($option_settings['blog_pagination_position']) && $option_settings['blog_pagination_position'] == 'end' ? 'checked' : '' }}
                    class="d-none" name="blog_pagination_position" id="right" value="end">
                {{ translate('right') }}
            </label>
        </div>
    </div>
</div>
<!-- Blog Pagination Number Settings Position Field End -->
