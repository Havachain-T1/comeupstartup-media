@extends('core::base.layouts.master')

@section('title')
    {{ translate('Add New Ad') }}
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
                        <h4 class="font-20">{{ translate('Add New Ad') }}</h4>
                    </div>
                    <form class="form-horizontal mt-4" action="{{ route('core.ads.store') }}" method="post">
                        @csrf
                        <div class="form-row mb-20">
                            <div class="col-sm-4">
                                <label for="name" class="font-14 bold black">{{ translate('Title') }} <span
                                        class="text-danger">*</span>
                                </label>
                            </div>
                            <div class="col-sm-8">
                                <input type="text" name="title" id="title" class="theme-input-style"
                                    value="{{ old('title') }}" placeholder="{{ translate('Enter Title') }}" required>

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
                                <input type="text" name="size" class="theme-input-style" value="{{ old('size') }}"
                                    placeholder="{{ translate('200X300') }}">
                            </div>
                        </div>
                        <div class="form-row mb-20">
                            <div class="col-sm-4">
                                <label class="font-14 bold black">{{ translate('Start date') }} </label>
                            </div>
                            <div class="col-sm-8">
                                <input type="datetime-local" name="start_date" class="theme-input-style"
                                    value="{{ old('start_date') }}">
                            </div>
                        </div>

                        <div class="form-row mb-20">
                            <div class="col-sm-4">
                                <label class="font-14 bold black">{{ translate('End date') }} </label>
                            </div>
                            <div class="col-sm-8">
                                <input type="datetime-local" name="end_date" class="theme-input-style"
                                    value="{{ old('end_date') }}">
                            </div>
                        </div>

                        <div class="form-row mb-20">
                            <div class="col-sm-4">
                                <label class="font-14 bold black" for="open_ended">{{ translate('Run without dates') }}</label>
                            </div>
                            <div class="col-sm-8">
                                <label class="d-flex align-items-center gap-10 mb-0">
                                    <input type="checkbox" name="open_ended" id="open_ended" value="1" @checked(old('open_ended'))>
                                    <span class="font-14">{{ translate('Show this ad when the start or end date is left blank') }}</span>
                                </label>
                                <small class="text-muted d-block mt-1">{{ translate('Ads with a blank date stay hidden unless this is ticked.') }}</small>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="col-sm-4">
                                <label class="font-14 bold black">{{ translate('Ad Type') }} </label>
                            </div>
                            <div class="align-items-center col-sm-8 d-flex gap-20">
                                <div class="form-group mb-20">
                                    <input type="radio" name="ad_type" class="ad_type" id="image-ad" value="image"
                                        checked />
                                    <label for="image-ad">{{ translate('Image') }}</label>
                                </div>
                                <div class="form-group mb-20">
                                    <input type="radio" name="ad_type" class="ad_type" id="i-frame-ad" value="iframe" />
                                    <label for="i-frame-ad">{{ translate('IFrame') }}</label>
                                </div>
                                <div class="form-group mb-20">
                                    <input type="radio" name="ad_type" class="ad_type" id="google-ads-sense"
                                        value="adsense" />
                                    <label for="google-ads-sense">{{ translate('Google Adsense') }}</label>
                                </div>
                            </div>
                        </div>

                        <div class="form-row mb-20 ad-type-input d-none" id="ad-sense-input">
                            <div class="col-sm-4">
                                <label class="font-14 bold black">{{ translate('Script') }} </label>
                            </div>
                            <div class="col-sm-8">
                                <textarea name="adsense_code" class="theme-input-style" placeholder="{{ translate('Enter Adsense Script') }}"></textarea>
                            </div>
                        </div>

                        <div class="form-row mb-20 ad-type-input d-none" id="iframe-input">
                            <div class="col-sm-4">
                                <label class="font-14 bold black">{{ translate('Source URL') }} </label>
                            </div>
                            <div class="col-sm-8">
                                <input type="text" name="iframe_source_url" class="theme-input-style"
                                    placeholder="{{ translate('Enter Iframe Source URL') }}">
                            </div>
                        </div>

                        <div class="mb-20 ad-type-input" id="image-input">
                            <div class="form-row mb-20">
                                <div class="col-sm-4">
                                    <label class="font-14 bold black">{{ translate('URL') }} </label>
                                </div>
                                <div class="col-sm-8">
                                    <input type="text" name="ad_url" class="theme-input-style"
                                        placeholder="{{ translate('Enter URL') }}">
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="col-sm-4">
                                    <label class="font-14 bold black">{{ translate('Image') }} </label>
                                </div>
                                <div class="col-sm-8">
                                    @include('core::base.includes.media.media_input', [
                                        'input' => 'ad_image',
                                        'data' => old('ad_image'),
                                    ])
                                </div>
                            </div>

                        </div>

                        <div class="form-group row">
                            <div class="offset-sm-4 col-sm-8">
                                <button type="submit" class="btn long">{{ translate('Save') }}</button>
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
