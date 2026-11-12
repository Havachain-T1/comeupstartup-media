@extends('core::base.layouts.master')

@section('title')
    {{ translate('Edit Ad') }}
@endsection

@section('custom_css')
@endsection

@section('main_content')
    <!-- Main Content -->
    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="card mb-30">
                <div class="card-body">
                    <div class="d-sm-flex justify-content-between align-items-center">
                        <h4 class="font-20">{{ translate('Edit Ad') }}</h4>
                    </div>
                    <form class="form-horizontal mt-4" action="{{ route('core.ads.update') }}" method="post">
                        @csrf
                        <input type="hidden" name="id" value="{{ $ad->id }}">
                        <div class="form-row mb-20">
                            <div class="col-sm-4">
                                <label for="name" class="font-14 bold black">{{ translate('Title') }} <span
                                        class="text-danger">*</span>
                                </label>
                            </div>
                            <div class="col-sm-8">
                                <input type="text" name="title" id="title" class="theme-input-style"
                                    value="{{ $ad->title }}" placeholder="{{ translate('Enter Title') }}">

                                @if ($errors->has('title'))
                                    <p class="text-danger">{{ $errors->first('title') }}</p>
                                @endif
                            </div>
                        </div>

                        <div class="form-row mb-20">
                            <div class="col-sm-4">
                                <label class="font-14 bold black">{{ translate('Size') }} </label>
                            </div>
                            <div class="col-sm-8">
                                <input type="text" name="size" class="theme-input-style" value="{{ $ad->size }}"
                                    placeholder="{{ translate('200X300') }}">
                            </div>
                        </div>
                        <div class="form-row mb-20">
                            <div class="col-sm-4">
                                <label class="font-14 bold black">{{ translate('Start date') }} </label>
                            </div>
                            <div class="col-sm-8">
                                <input type="datetime-local" name="start_date" class="theme-input-style"
                                    value="{{ $ad->start_date }}">
                            </div>
                        </div>

                        <div class="form-row mb-20">
                            <div class="col-sm-4">
                                <label class="font-14 bold black">{{ translate('End date') }} </label>
                            </div>
                            <div class="col-sm-8">
                                <input type="datetime-local" name="end_date" class="theme-input-style"
                                    value="{{ $ad->end_date }}">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="col-sm-4">
                                <label class="font-14 bold black">{{ translate('Ad Type') }} </label>
                            </div>
                            <div class="align-items-center col-sm-8 d-flex gap-20">
                                <div class="form-group mb-20">
                                    <input type="radio" name="ad_type" class="ad_type" id="image-ad" value="image"
                                        @checked($ad->type == 'image') />
                                    <label for="image-ad">{{ translate('Image') }}</label>
                                </div>
                                <div class="form-group mb-20">
                                    <input type="radio" name="ad_type" class="ad_type" id="i-frame-ad" value="iframe"
                                        @checked($ad->type == 'iframe') />
                                    <label for="i-frame-ad">{{ translate('IFrame') }}</label>
                                </div>
                                <div class="form-group mb-20">
                                    <input type="radio" name="ad_type" class="ad_type" id="google-ads-sense"
                                        value="adsense" @checked($ad->type == 'adsense') />
                                    <label for="google-ads-sense">{{ translate('Google Adsense') }}</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-row mb-20 ad-type-input {{ $ad->type == 'adsense' ? '' : 'd-none' }}"
                            id="ad-sense-input">
                            <div class="col-sm-4">
                                <label class="font-14 bold black">{{ translate('Script') }} </label>
                            </div>
                            <div class="col-sm-8">
                                <textarea name="adsense_code" class="theme-input-style" placeholder="{{ translate('Enter Adsense Script') }}">{{ $ad->content }}</textarea>
                            </div>
                        </div>

                        <div class="form-row mb-20 ad-type-input {{ $ad->type == 'iframe' ? '' : 'd-none' }}"
                            id="iframe-input">
                            <div class="col-sm-4">
                                <label class="font-14 bold black">{{ translate('Source URL') }} </label>
                            </div>
                            <div class="col-sm-8">
                                <input type="text" name="iframe_source_url" class="theme-input-style"
                                    placeholder="{{ translate('Enter Iframe Source URL') }}" value="{{ $ad->content }}">
                            </div>
                        </div>

                        <div class="mb-20 ad-type-input {{ $ad->type == 'image' ? '' : 'd-none' }}" id="image-input">
                            <div class="form-row mb-20">
                                <div class="col-sm-4">
                                    <label class="font-14 bold black">{{ translate('URL') }} </label>
                                </div>
                                <div class="col-sm-8">
                                    <input type="text" name="ad_url" class="theme-input-style"
                                        placeholder="{{ translate('Enter URL') }}" value="{{ $ad->url }}">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="col-sm-4">
                                    <label class="font-14 bold black">{{ translate('Image') }} </label>
                                </div>
                                <div class="col-sm-8">
                                    @include('core::base.includes.media.media_input', [
                                        'input' => 'ad_image',
                                        'data' => $ad->content,
                                    ])
                                </div>
                            </div>

                        </div>

                        <div class="form-row mb-20">
                            <div class="col-sm-4">
                                <label class="font-14 bold black">{{ translate('Status') }} </label>
                            </div>
                            <div class="col-sm-8">
                                <select name="status" class="theme-input-style">
                                    <option value="1" @selected($ad->status == 1)>{{ translate('Active') }}</option>
                                    <option value="2" @selected($ad->status == 2)>{{ translate('Inactive') }}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="offset-sm-4 col-sm-8">
                                <button type="submit" class="btn long">{{ translate('Save Chnages') }}</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    @include('core::base.media.partial.media_modal')

    <!-- End Main Content -->
@endsection

@section('custom_scripts')
    <script>
        (function($) {
            "use strict";
            initDropzone();

            $(document).on('click', '.ad_type', function() {
                let ad_type = $(this).val();
                console.log(ad_type)

                $(".ad-type-input").addClass('d-none');
                if (ad_type === 'iframe') {
                    $('#iframe-input').removeClass('d-none');
                }
                if (ad_type === 'image') {
                    $('#image-input').removeClass('d-none');
                }
                if (ad_type === 'adsense') {
                    $('#ad-sense-input').removeClass('d-none');
                }
            });

        })(jQuery);
    </script>
@endsection
