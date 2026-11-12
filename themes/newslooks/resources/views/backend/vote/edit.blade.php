@extends('core::base.layouts.master')

@section('title')
    {{ translate('Edit Vote') }}
@endsection

@section('custom_css')
@endsection

@section('main_content')
    <!-- Main Content -->
    <div class="row">
        <div class="col-lg-7 mx-auto">
            <div class="row">
                <div class="col-12 mb-3">
                    <p class="alert alert-info">You are editing <strong>"{{ getLanguageNameByCode($lang) }}"</strong> version
                    </p>
                </div>
                <div class="col-12">
                    <ul class="nav nav-tabs nav-fill border-light border-0">
                        @foreach ($languages as $key => $language)
                            <li class="nav-item">
                                <a class="nav-link @if ($language->code == $lang) active border-0 @else bg-light @endif py-3"
                                    href="{{ route('theme.newslooks.vote.edit', ['vote' => $vote->id, 'lang' => $language->code]) }}">
                                    <img src="{{ asset('/public/flags/') . '/' . $language->code . '.png' }}"
                                        width="20px">
                                    <span>{{ $language->name }}</span>
                                </a>
                            </li>
                        @endforeach
                    </ul>
                </div>
            </div>
            <div class="card mb-30">
                <div class="card-body">
                    <div class="d-sm-flex justify-content-between align-items-center">
                        <h4 class="font-20">{{ translate('Edit Vote') }}</h4>
                    </div>
                    <form class="form-horizontal mt-4"
                        action="{{ route('theme.newslooks.vote.update', ['vote' => $vote->id]) }}" method="post" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')

                        <input type="hidden" name="lang" value="{{ $lang }}">

                        <div class="form-row mb-20">
                            <label for="title" class="col-sm-4 font-14 bold black">{{ translate('Title') }}
                            </label>
                            <div class="col-sm-8">
                                <input type="text" name="title" id="title" class="form-control"
                                    value="{{ $vote->translation($lang) }}" placeholder="{{ translate('Title') }}" required>

                                @error('title')
                                    <p class="text-danger">{{ $errors->first('title') }}</p>
                                @enderror
                            </div>
                        </div>

                        <div class="form-row mb-20 @if (!empty($lang) && $lang != getDefaultLang()) area-disabled @endif">
                            <label for="title" class="col-sm-4 font-14 bold black">{{ translate('Vote End') }}
                            </label>
                            <div class="col-sm-8">
                                <input type="datetime-local" name="date" id="date" class="form-control"
                                    value="{{ $vote->date }}" placeholder="{{ translate('Date') }}" required>

                                @error('date')
                                    <p class="text-danger">{{ $errors->first('date') }}</p>
                                @enderror
                            </div>
                        </div>

                        <div class="form-row mb-20 @if (!empty($lang) && $lang != getDefaultLang()) area-disabled @endif">
                            <div class="col-sm-4">
                                <label class="font-14 bold black">{{ translate('Voting Featured Image') }} </label>
                            </div>
                            <div class="col-sm-8">
                                @include('core::base.includes.media.media_input', [
                                    'input' => 'image',
                                    'data' => $vote->image,
                                ])

                                @error('image')
                                    <p class="text-danger">{{ $errors->first('image') }}</p>
                                @enderror
                            </div>
                        </div>

                        <div class="form-row mb-20 @if (!empty($lang) && $lang != getDefaultLang()) area-disabled @endif">
                            <label class="col-sm-4 font-14 bold black">{{ translate('Options') }}
                            </label>
                            <div class="col-sm-8">
                                <div class="repeater-list">
                                    @foreach ($vote->options as $option)
                                        <div class="repeater-item">
                                            <div class="row mb-3">
                                                <div class="col-9">
                                                    <input type="text" name="options[{{ $option->id }}]" id="option"
                                                        class="form-control" placeholder="{{ translate('Option') }}" value="{{ $option->options }}">
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
                                    @endforeach
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
