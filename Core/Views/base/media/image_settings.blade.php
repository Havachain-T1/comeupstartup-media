@php
    $image_types = getAllImageTypes();
    $placeholder_info = getPlaceHolderImage();
    $placeholder_image = '';
    $placeholder_image_alt = '';

    if ($placeholder_info != null) {
        $placeholder_image = $placeholder_info->placeholder_image;
        $placeholder_image_alt = $placeholder_info->placeholder_image_alt;
    }
@endphp
@extends('core::base.layouts.master')
@section('title')
    {{ translate('Media Settings') }}
@endsection
@section('custom_css')
    <link rel="stylesheet" href="{{ asset('/public/backend/assets/plugins/select2/select2.min.css') }}">
@endsection
@section('main_content')
    <!-- Image Settings -->
    <div class="row">
        <div class="col-md-8 mb-30">
            <div class="card">
                <div class="card-body">
                    <div class="post-head d-flex justify-content-between align-items-center mb-3">
                        <div class="d-flex align-items-center">
                            <div class="content">
                                <h4 class="mb-1">{{ translate('Media Settings') }}</h4>
                            </div>
                        </div>
                    </div>

                    <div>
                        <form action="{{ route('core.store.media.settings') }}" method="POST"
                            enctype="multipart/form-data">
                            @csrf

                            <div class="form-row mb-20">
                                <div class="col-sm-4">
                                    <label class="font-14 bold black">{{ translate('File Storage') }} </label>
                                </div>
                                <div class="col-sm-8">
                                    <select name="file_storage" class="theme-input-style file_storage_option">
                                        <option value="public" @if (getGeneralSetting('file_storage') == 'public') selected @endif>
                                            {{ translate('Local') }}
                                        </option>
                                        <option value="amazons3" @if (getGeneralSetting('file_storage') == 'amazons3') selected @endif>
                                            {{ translate('Amazon S3') }}
                                        </option>
                                    </select>
                                    @if ($errors->has('file_storage'))
                                        <div class="invalid-input">{{ $errors->first('file_storage') }}</div>
                                    @endif
                                </div>
                            </div>
                            <!--Amazon s3 settings-->
                            <div
                                class="amazon-s3-setup {{ getGeneralSetting('file_storage') == 'amazons3' ? '' : 'd-none' }}">
                                <div class="form-row mb-20">
                                    <div class="col-sm-4">
                                        <label class="font-14 bold black">{{ translate('AWS ACCESS KEY ID') }}
                                        </label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="text" name="aws_access_key_id" class="theme-input-style"
                                            placeholder="{{ translate('Type here') }}"
                                            value="{{ env('AWS_ACCESS_KEY_ID') }}">
                                        @if ($errors->has('aws_access_key_id'))
                                            <div class="invalid-input">{{ $errors->first('aws_access_key_id') }}
                                            </div>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-row mb-20">
                                    <div class="col-sm-4">
                                        <label class="font-14 bold black">{{ translate('AWS SECRET ACCESS KEY') }}
                                        </label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="text" name="aws_secret_access_key" class="theme-input-style"
                                            placeholder="{{ translate('Type here') }}"
                                            value="{{ env('AWS_SECRET_ACCESS_KEY') }}">
                                        @if ($errors->has('aws_secret_access_key'))
                                            <div class="invalid-input">{{ $errors->first('aws_secret_access_key') }}
                                            </div>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-row mb-20">
                                    <div class="col-sm-4">
                                        <label class="font-14 bold black">{{ translate('AWS DEFAULT REGION') }}
                                        </label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="text" name="aws_default_region" class="theme-input-style"
                                            placeholder="{{ translate('Type here') }}"
                                            value="{{ env('AWS_DEFAULT_REGION') }}">
                                        @if ($errors->has('aws_default_region'))
                                            <div class="invalid-input">
                                                {{ $errors->first('aws_default_region') }}</div>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-row mb-20">
                                    <div class="col-sm-4">
                                        <label class="font-14 bold black">{{ translate('AWS BUCKET') }}
                                        </label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="text" name="aws_bucket" class="theme-input-style"
                                            placeholder="{{ translate('Type here') }}" value="{{ env('AWS_BUCKET') }}">
                                        @if ($errors->has('aws_bucket'))
                                            <div class="invalid-input">
                                                {{ $errors->first('aws_bucket') }}</div>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-row mb-20">
                                    <div class="col-sm-4">
                                        <label class="font-14 bold black">{{ translate('AWS URL') }}
                                        </label>
                                    </div>
                                    <div class="col-sm-8">
                                        <input type="text" name="aws_endpoint" class="theme-input-style"
                                            placeholder="{{ translate('Type here') }}" value="{{ env('AWS_URL') }}">
                                        @if ($errors->has('aws_endpoint'))
                                            <div class="invalid-input">
                                                {{ $errors->first('aws_endpoint') }}</div>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <!--End Amazon s3 settings-->

                            <div class="form-row mb-20">
                                <div class="col-md-4">
                                    <label class="font-14 bold black">{{ translate('Placeholder Image') }}</label>
                                </div>
                                <div class="col-md-8">
                                    @include('core::base.includes.media.media_input', [
                                        'input' => 'placeholder_image',
                                        'data' => $data['placeholder_image_id'],
                                    ])
                                    @if ($errors->has('placeholder_image'))
                                        <div class="invalid-input">{{ $errors->first('placeholder_image') }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="col-md-12 text-right">
                                    <button type="submit" class="btn long">{{ translate('Submit') }}</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        @include('core::base.media.partial.media_modal')
    </div>
    <!-- /Image Settings -->
@endsection
@section('custom_scripts')
    <script src="{{ asset('/public/backend/assets/plugins/select2/select2.min.js') }}"></script>
    <script>
        (function($) {
            "use strict";
            initDropzone()
            $(document).ready(function() {
                is_for_browse_file = true
                filtermedia();

                //Select file storage system
                $('.file_storage_option').on('change', function(e) {
                    let value = $(this).val();
                    if (value == 'amazons3') {
                        $('.amazon-s3-setup').removeClass('d-none');
                    } else {
                        $('.amazon-s3-setup').addClass('d-none');
                    }
                });

            });
        })(jQuery);


        /**
         * Hide & show chunk size upload status 
         */
        function toggleChunkSizeUploadStatus() {
            "use strict";
            if (!$('#chunk_size_upload').is(":checked")) {
                $('#chunk_size_upload_settings').hide()
            } else {
                $('#chunk_size_upload_settings').show()
            }
        }
    </script>
@endsection
