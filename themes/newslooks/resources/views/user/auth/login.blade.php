@extends('theme/newslooks::frontend.layout.master')

@section('seo')
    {{-- SEO --}}
    <title>{{ front_translate('Login') }}</title>
@endsection

@section('content')
    <!-- Page Title -->
    <div class="page-title-wrap pt-30">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <ul class="breadcrumb nav">
                        <li><a href="{{ route('home') }}"><i class="fa fm fa-home"></i>{{ front_translate('Home') }}</a></li>
                        <li class="active"><span>{{ front_translate('Login') }}</span></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- End Page Title -->

    <div class="pt-50 mt-5 pb-60">
        <div class="container">
            <div class="card justify-content-center auth-card border-0">
                <div class="row justify-content-center">
                    <div class="col-sm-6 mx-auto user-auth-form">

                        <form action="{{ route('theme.newslooks.user.attemptLogin') }}" method="POST">
                            @csrf
                            <!-- Form Group -->
                            <div class="form-group mb-20">
                                <label for="email">{{ front_translate('Email Address') }}</label>
                                <input type="email" name="email" id="email" class="theme-input-style"
                                    placeholder="{{ front_translate('Email Address') }}" required>
                                @error('email')
                                    <p class="text-danger">{{ $errors->first('email') }}</p>
                                @enderror
                            </div>
                            <!-- End Form Group -->

                            <!-- Form Group -->
                            <div class="form-group mb-20">
                                <label for="password">{{ front_translate('Password') }}</label>
                                <input type="password" name="password" id="password" class="theme-input-style"
                                    placeholder="{{ front_translate('Password') }}" required>
                                @error('password')
                                    <p class="text-danger">{{ $errors->first('password') }}</p>
                                @enderror
                            </div>
                            <!-- End Form Group -->

                            <div class="d-flex align-items-center mt-25">
                                <button type="submit" class="btn login-btn">{{ front_translate('Log In') }}</button>
                                <span class="font-12 d-block">{{ front_translate('If you have no account?') }}<a
                                        class="bold c2 title-color-two-hover ml-1"
                                        href="{{ route('theme.newslooks.user.registration') }}">{{ front_translate('Register') }}</a></span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection