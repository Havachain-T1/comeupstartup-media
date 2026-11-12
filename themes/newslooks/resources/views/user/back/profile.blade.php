@extends('core::base.layouts.master')

@section('title')
    {{ front_translate('User Profile') }}
@endsection

@section('custom_css')
@endsection

@section('main_content')
    <!-- Main Content -->
    <div class="row">
        <div class="col-md-8 mb-30 offset-md-2">
            <!-- User profile-->
            <div class="card">
                <div class="card-body">
                    <div class="post-head d-flex justify-content-between align-items-center mb-3">
                        <div class="d-flex align-items-center">
                            <div class="content">
                                <h4 class="mb-1">{{ front_translate('Update Profile') }}</h4>
                            </div>
                        </div>
                    </div>

                    <div>
                        <form action="{{ route('theme.newslooks.user.update.profile', ['user' => $user->id]) }}"
                            method="POST" enctype="multipart/form-data">
                            @csrf

                            <div class="form-row mb-20">
                                <div class="col-md-4">
                                    <label class="font-14 bold black">{{ front_translate('Profile Picture') }}</label>
                                    <small class="d-block">max size 100kb and type jpg,png,svg,jpeg only</small>
                                </div>
                                <div class="col-md-8">
                                    <input class="form-control" type="file" name="image"
                                        accept="image/png, image/jpg, image/jpeg, image/svg+xml">
                                    @error('image')
                                        <p class="text-danger">{{ $errors->first('image') }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-row mb-20">
                                <div class="col-md-4">
                                    <label class="font-14 bold black">{{ front_translate('Name') }}</label>
                                </div>
                                <div class="col-md-8">
                                    <input type="text" name="name" class="theme-input-style"
                                        value="{{ $user->name }}" placeholder="{{ front_translate('Your Name') }}" required>
                                    @error('name')
                                        <p class="text-danger">{{ $errors->first('name') }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-row mb-20">
                                <div class="col-md-4">
                                    <label class="font-14 bold black">{{ front_translate('Email') }}</label>
                                </div>
                                <div class="col-md-8">
                                    <input type="email" name="email" class="theme-input-style"
                                        value="{{ $user->email }}" placeholder="{{ front_translate('Your Email') }}" required>
                                    @error('email')
                                        <p class="text-danger">{{ $errors->first('email') }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="col-md-12 text-right">
                                    <button type="submit" class="btn long">{{ front_translate('Update') }}</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /User profile-->

            <!-- User profile-->
            <div class="card mt-5">
                <div class="card-body">
                    <div class="post-head d-flex justify-content-between align-items-center mb-3">
                        <div class="d-flex align-items-center">
                            <div class="content">
                                <h4 class="mb-1">{{ front_translate('Update Password') }}</h4>
                            </div>
                        </div>
                    </div>
                    <div>
                        <form action="{{ route('theme.newslooks.user.update.password', ['user' => $user->id]) }}"
                            method="POST">
                            @csrf

                            <div class="form-row mb-20">
                                <div class="col-md-4">
                                    <label class="font-14 bold black">{{ front_translate('Old Password') }}</label>
                                </div>
                                <div class="col-md-8">
                                    <input type="password" name="old_password" class="theme-input-style"
                                        placeholder="{{ front_translate('Old Password') }}" required>
                                    @error('old_password')
                                        <p class="text-danger">{{ $errors->first('old_password') }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-row mb-20">
                                <div class="col-md-4">
                                    <label class="font-14 bold black">{{ front_translate('Password') }}</label>
                                </div>
                                <div class="col-md-8">
                                    <input type="password" name="password" class="theme-input-style"
                                        placeholder="{{ front_translate('New Password') }}" required>
                                    @error('password')
                                        <p class="text-danger">{{ $errors->first('password') }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-row mb-20">
                                <div class="col-md-4">
                                    <label class="font-14 bold black">{{ front_translate('Confirm Password') }}</label>
                                </div>
                                <div class="col-md-8">
                                    <input type="password" name="password_confirmation" class="theme-input-style"
                                        placeholder="{{ front_translate('Confirm your password') }}" required>
                                    @error('password_confirmation')
                                        <p class="text-danger">{{ $errors->first('password_confirmation') }}</p>
                                    @enderror
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="col-md-12 text-right">
                                    <button type="submit" class="btn long">{{ front_translate('Update') }}</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /User profile-->
        </div>
    </div>
    @include('core::base.media.partial.media_modal')
    <!-- End Main Content -->
@endsection

@section('custom_scripts')
@endsection
