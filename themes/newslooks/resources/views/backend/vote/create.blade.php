@extends('core::base.layouts.master')

@section('title')
    {{ translate('Create Voting') }}
@endsection

@section('custom_css')
@endsection

@section('main_content')
    <!-- Main Content -->
    <div class="row">
        <div class="col-lg-7 mx-auto">
            <div class="mb-3">
                <p class="alert alert-info">You are inserting
                    <strong>"{{ getLanguageNameByCode(getDefaultLang()) }}"</strong> version
                </p>
            </div>
            <div class="card mb-30">
                <div class="card-body">
                    <div class="d-sm-flex justify-content-between align-items-center">
                        <h4 class="font-20">{{ translate('Add Tag') }}</h4>
                    </div>
                    <form class="form-horizontal mt-4" action="{{ route('theme.newslooks.vote.store') }}" method="post" enctype="multipart/form-data">
                        @csrf

                        <div class="form-row mb-20">
                            <label for="title" class="col-sm-4 font-14 bold black">{{ translate('Title') }}
                            </label>
                            <div class="col-sm-8">
                                <input type="text" name="title" id="title" class="form-control"
                                    value="{{ old('title') }}" placeholder="{{ translate('Title') }}" required>

                                @error('title')
                                    <p class="text-danger">{{ $errors->first('title') }}</p>
                                @enderror
                            </div>
                        </div>

                        <div class="form-row mb-20">
                            <label for="title" class="col-sm-4 font-14 bold black">{{ translate('Vote End') }}
                            </label>
                            <div class="col-sm-8">
                                <input type="datetime-local" name="date" id="date" class="form-control"
                                    value="{{ old('date') }}" placeholder="{{ translate('Date') }}" required>

                                @error('date')
                                    <p class="text-danger">{{ $errors->first('date') }}</p>
                                @enderror
                            </div>
                        </div>

                        <div class="form-row mb-20">
                            <div class="col-sm-4">
                                <label class="font-14 bold black">{{ translate('Voting Featured Image') }} </label>
                            </div>
                            <div class="col-sm-8">
                                @include('core::base.includes.media.media_input', [
                                    'input' => 'image',
                                    'data' => old('image'),
                                ])

                                @error('image')
                                    <p class="text-danger">{{ $errors->first('image') }}</p>
                                @enderror
                            </div>
                        </div>

                        <div class="form-row mb-20">
                            <label class="col-sm-4 font-14 bold black">{{ translate('Options') }}
                            </label>
                            <div class="col-sm-8">

                                <div class="repeater-list">
                                    <div class="repeater-item">
                                        <div class="row mb-3">
                                            <div class="col-9">
                                                <input type="text" name="options[]" id="option" class="form-control"
                                                    placeholder="{{ translate('Option') }}">
                                            </div>
                                            <div class="col-3 text-right">
                                                <!-- Repeater Remove Btn -->
                                                <button type="button" class="remove-btn style--two">
                                                    <img src="{{ asset('public/backend/assets/img/svg/remove.svg') }}"
                                                        alt="" class="svg">
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="repeater-item">
                                        <div class="row mb-3">
                                            <div class="col-9">
                                                <input type="text" name="options[]" id="option" class="form-control"
                                                    placeholder="{{ translate('Option') }}">
                                            </div>
                                            <div class="col-3 text-right">
                                                <!-- Repeater Remove Btn -->
                                                <button type="button" class="remove-btn style--two">
                                                    <img src="{{ asset('public/backend/assets/img/svg/remove.svg') }}"
                                                        alt="" class="svg">
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="repeater-item">
                                        <div class="row mb-3">
                                            <div class="col-9">
                                                <input type="text" name="options[]" id="option" class="form-control"
                                                    placeholder="{{ translate('Option') }}">
                                            </div>
                                            <div class="col-3 text-right">
                                                <!-- Repeater Remove Btn -->
                                                <button type="button" class="remove-btn style--two">
                                                    <img src="{{ asset('public/backend/assets/img/svg/remove.svg') }}"
                                                        alt="" class="svg">
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                @error('options')
                                    <p class="text-danger">{{ $errors->first('options') }}</p>
                                @enderror

                                <div class="pt-3">
                                    <!-- Repeater Add Btn -->
                                    <button type="button" class="repeater-new-item btn-circle position-relative">
                                        <img src="{{ asset('public/backend/assets/img/svg/plus_white.svg') }}"
                                            alt="" class="svg">
                                    </button>
                                    <span class="bold c2 ml-1">{{ translate('Add New') }}</span>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row justify-content-end">
                            <div class="col-2">
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
            initDropzone()
            $(document).ready(function() {
                is_for_browse_file = true
                filtermedia()
            });

            $('.repeater-new-item').on('click', function() {
                $('.repeater-list').append(`
                    <div class="repeater-item">
                        <div class="row mb-3">
                            <div class="col-9">
                                <input type="text" name="options[]" id="option" class="form-control"
                                    placeholder="{{ translate('Option') }}">
                            </div>
                            <div class="col-3 text-right">
                                <!-- Repeater Remove Btn -->
                                <button type="button" class="remove-btn style--two">
                                    <img src="{{ asset('public/backend/assets/img/svg/remove.svg') }}"
                                         alt="" class="svg">
                                </button>
                            </div>
                        </div>
                    </div>
                `);

                removeRepeater();
            });

            removeRepeater();

            function removeRepeater() {
                // Remove Option
                $('.remove-btn').on('click', function() {
                    $(this).closest('.repeater-item').remove();
                })
            }

        })(jQuery)
    </script>
@endsection
