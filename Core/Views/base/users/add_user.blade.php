@php
    $roles = getAllRoleForAssign();
    
    $placeholder_info = getPlaceHolderImage();
    $placeholder_image = $placeholder_info != null ? $placeholder_info->placeholder_image : '';
    $placeholder_image_alt = $placeholder_info != null ? $placeholder_info->placeholder_image_alt : '';
@endphp

@extends('core::base.layouts.master')

@section('title')
    {{ translate('Add User') }}
@endsection

@section('custom_css')
    <link rel="stylesheet" href="{{ asset('/public/backend/assets/plugins/select2/select2.min.css') }}">
@endsection

@section('main_content')
    <div class="row">
        <div class="col-md-7 mb-30">
            <!-- Add new user-->
            <div class="card">
                <div class="card-body">
                    <div class="post-head d-flex justify-content-between align-items-center mb-3">
                        <div class="d-flex align-items-center">
                            <div class="content">
                                <h4 class="mb-1">{{ translate('Add User') }}</h4>
                            </div>
                        </div>
                    </div>

                    <div>
                        <form action="{{ route('core.store.user') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="form-row mb-20">
                                <div class="col-md-4">
                                    <label class="font-14 bold black">{{ translate('Profile Picture') }}</label>
                                </div>
                                <div class="col-md-8">
                                    @include('core::base.includes.media.media_input', [
                                        'input' => 'image',
                                        'data' => null,
                                    ])
                                    @if ($errors->has('image'))
                                        <div class="invalid-input">{{ $errors->first('image') }}</div>
                                    @endif
                                </div>
                            </div>

                            <div class="form-row mb-20">
                                <div class="col-md-4">
                                    <label class="font-14 bold black">{{ translate('Name') }}</label>
                                </div>
                                <div class="col-md-8">
                                    <input type="text" name="name" class="theme-input-style"
                                        value="{{ old('name') }}" placeholder="{{ translate('Give your name') }}">
                                    @if ($errors->has('name'))
                                        <div class="invalid-input">{{ $errors->first('name') }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="form-row mb-20">
                                <div class="col-md-4">
                                    <label class="font-14 bold black">{{ translate('Email') }}</label>
                                </div>
                                <div class="col-md-8">
                                    <input type="email" name="email" class="theme-input-style"
                                        value="{{ old('email') }}"
                                        placeholder="{{ translate('Give your email address') }}">
                                    @if ($errors->has('email'))
                                        <div class="invalid-input">{{ $errors->first('email') }}</div>
                                    @endif
                                </div>
                            </div>

                            <div class="form-row mb-20">
                                <div class="col-md-4">
                                    <label class="font-14 bold black">{{ translate('Assign Role') }}</label>
                                </div>
                                <div class="col-md-8">
                                    <select id='seectRole' name="role[]" class="theme-input-style" multiple>
                                        @foreach ($roles as $role)
                                            <option value="{{ $role->id }}" class="text-uppercase">{{ $role->name }}
                                            </option>
                                        @endforeach
                                    </select>
                                    @if ($errors->has('role'))
                                        <div class="invalid-input">{{ $errors->first('role') }}</div>
                                    @endif
                                </div>
                            </div>

                            <div class="form-row mb-20">
                                <div class="col-md-4">
                                    <label class="font-14 bold black">{{ translate('Status') }}</label>
                                </div>
                                <div class="col-md-8">
                                    <label class="switch success">
                                        <input type="checkbox" checked="checked" name="status">
                                        <span class="control"></span>
                                    </label>
                                </div>
                            </div>

                            <div class="form-row mb-20">
                                <div class="col-md-4">
                                    <label class="font-14 bold black">{{ translate('Password') }}</label>
                                </div>
                                <div class="col-md-8">
                                    <input type="password" name="password" class="theme-input-style"
                                        placeholder="{{ translate('Give your password') }}">
                                    @if ($errors->has('password'))
                                        <div class="invalid-input">{{ $errors->first('password') }}</div>
                                    @endif
                                </div>
                            </div>
                            <div class="form-row mb-20">
                                <div class="col-md-4">
                                    <label class="font-14 bold black">{{ translate('Confirm Password') }}</label>
                                </div>
                                <div class="col-md-8">
                                    <input type="password" name="password_confirmation" class="theme-input-style"
                                        placeholder="{{ translate('Confirm your password') }}">
                                    @if ($errors->has('password_confirmation'))
                                        <div class="invalid-input">{{ $errors->first('password_confirmation') }}</div>
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
            <!-- /Add new user-->
        </div>
        @include('core::base.media.partial.media_modal')
    </div>
@endsection
@section('custom_scripts')
    <script src="{{ asset('/public/backend/assets/plugins/select2/select2.min.js') }}"></script>
    <script>
        (function($) {
            "use strict";
            initDropzone()
            $(document).ready(function() {
                is_for_browse_file = true
                filtermedia()
                $('#seectRole').select2()
            });
        })(jQuery);
    </script>
@endsection
