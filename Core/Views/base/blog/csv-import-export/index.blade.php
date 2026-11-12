@php
    $default_language = getDefaultLang();
@endphp
@extends('core::base.layouts.master')

@section('title')
    {{ translate('CSV Import/Export') }}
@endsection

@section('custom_css')
    <style>
        table tbody tr td span {
            display: block
        }

        p {
            color: black;
        }
    </style>
@endsection

@section('main_content')
    <!-- Main Content -->
    <div class="row">

        <div class="col-md-7">
            <div class="card mb-30">
                <form class="form-horizontal my-4 mb-4 import-form" action="{{ route('core.blog.csv.import.submit') }}"
                    method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="card-body">
                        <div class="d-sm-flex justify-content-between align-items-center">
                            <h4 class="font-20">{{ translate('Import') }}</h4>
                            <a href="{{ route('core.blog') }}" class="btn btn-primary sm">{{ translate('All Posts') }}</a>
                        </div>

                        <div class="my-4">
                            <label class="mb-2 font-14 bold">{{ translate('Supported File Type') }} : CSV</label>
                            <label class="mb-3 font-14 bold d-block">{{ translate('File Max Size') }} : 5MB</label>

                            <input class="form-control" type="file" id="csvFile" name="file">

                            <p class="text-danger mt-2 font-weight-bold import-error-text"></p>
                        </div>

                        <div class="form-group">
                            <button type="submit"
                                class="btn btn-primary import-submit-btn">{{ translate('Import') }}</button>
                            <img src="{{ asset('public/loader.svg') }}" alt="" width="60px"
                                class="import-loader d-none">
                        </div>
                        <p class="import-message text-danger font-weight-bold d-none">
                            {{ translate("Importing CSV Post May Take Some Time. Don't Close or Refresh this Page.") }}
                        </p>
                    </div>
                </form>
            </div>
        </div>

        <div class="col-md-5">
            <div class="card mb-30">
                <div class="card-body">
                    <div class="d-sm-flex justify-content-between align-items-center">
                        <h4 class="font-20">{{ translate('Instructions') }}</h4>
                    </div>
                    <div class="mt-4">
                        <a href="{{ asset('public/import-template.csv') }}" download
                            class="btn btn-block btn-border btn-square d-block">
                            {{ translate('CSV Template') }}
                        </a>

                        <a href="{{ asset('public/import-example.csv') }}" download
                            class="btn btn-block btn-border btn-square d-block mt-3">
                            {{ translate('CSV Example') }}
                        </a>

                        <a href="javascript:void(0);" class="btn btn-block btn-border btn-square d-block mt-3 csv-doc">
                            {{ translate('Documentation') }}
                        </a>
                        <a href="javascript:void(0);"
                            class="btn btn-block btn-border btn-square d-block mt-3 wordpress-doc">
                            {{ translate('How To Import Wordpress Post') }}?
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-7">
            <div class="card mb-30">
                <form class="form-horizontal my-4 mb-4 export-form" action="{{ route('core.blog.csv.export') }}"
                    method="get" enctype="multipart/form-data">
                    <div class="card-body">
                        <div class="d-sm-flex justify-content-between align-items-center">
                            <h4 class="font-20">{{ translate('Export') }}</h4>
                        </div>

                        <div class="form-group mt-4">
                            <button type="submit"
                                class="btn btn-primary export-submit-btn">{{ translate('Export') }}</button>
                            <img src="{{ asset('public/loader.svg') }}" alt="" width="60px"
                                class="export-loader d-none">
                        </div>
                        <p class="export-message text-danger font-weight-bold d-none">
                            {{ translate("Exporting CSV Post May Take Some Time. Don't Close or Refresh this Page.") }}</p>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- End Main Content -->

    <!-- CSV Documentation -->
    @includeIf('core::base.blog.csv-import-export.csv-doc-modal')
    <!-- CSV Documentation End-->

    <!-- CSV Documentation -->
    @includeIf('core::base.blog.csv-import-export.wordpress-import-modal')
    <!-- CSV Documentation End-->
@endsection

@section('custom_scripts')
    <script>
        (function($) {
            "use strict";

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });

            // Import Button Click
            $(document).on('submit', '.import-form', function(e) {
                e.preventDefault();

                $('.import-loader').removeClass('d-none');
                $('.import-message').removeClass('d-none');
                $('.import-submit-btn').attr('disabled', true);

                let formData = new FormData();
                let file = $('#csvFile')[0].files[0];
                formData.append('file', file);

                $.ajax({
                    url: "{{ route('core.blog.csv.import.submit') }}",
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        toastr.success(response.message, "Success!");
                        $('.import-error-text').text('');
                        $('.import-loader').addClass('d-none');
                        $('.import-message').addClass('d-none');
                        $('.import-submit-btn').attr('disabled', false);
                        $('.import-form').trigger("reset");
                    },
                    error: function(error) {
                        let message = error.message ? error.message : error.responseJSON.message;

                        $('.import-error-text').text(message);
                        $('.import-loader').addClass('d-none');
                        $('.import-message').addClass('d-none');
                        $('.import-submit-btn').attr('disabled', false);
                        $('.import-form').trigger("reset");
                    }
                });
            });

            // Export Button Click and Download Export File
            $(document).on('submit', '.export-form', function() {
                $('.export-loader').removeClass('d-none');
                $('.export-message').removeClass('d-none');
                $('.export-submit-btn').attr('disabled', true);

                let url = $(this).attr('action');

                $.ajax({
                    type: "get",
                    url: url,
                    success: function(response) {
                        $('.export-loader').addClass('d-none');
                        $('.export-message').addClass('d-none');
                        $('.export-submit-btn').attr('disabled', false);
                    },
                    error: function(error) {
                        let message = error.message ?? error.responseJSON.message;
                        toastr.error(message, "Success!");
                        $('.export-loader').addClass('d-none');
                        $('.export-message').addClass('d-none');
                        $('.export-submit-btn').attr('disabled', false);
                    }
                });

            });

            // CSV Documentation
            $(document).on('click', '.csv-doc', function() {
                $('#csv-doc').modal('show');
            });

            // Wordpress Import Documentation
            $(document).on('click', '.wordpress-doc', function() {
                $('#wordpress-doc').modal('show');
            });

        })(jQuery);
    </script>
@endsection
