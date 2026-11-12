@extends('core::base.auth.auth_layout')

@section('title')
    {{ translate('Login') }}
@endsection

@section('main_content')
    <div class="row align-items-center justify-content-center mn-vh-100">
        <!-- Card -->
        <div class="card justify-content-center p-5">
            <div class="row justify-content-center">
                <div class="col-12">
                    <h4 class="mb-5 font-20">{{ translate('Login To') }} {{ getGeneralSetting('system_name') }}</h4>
                    <form action="{{ route('core.attemptLogin') }}" method="post">
                        @csrf
                        <!-- Form Group -->
                        <div class="form-group mb-20">
                            <label for="email" class="mb-2 font-14 bold black">{{ translate('Email') }}</label>
                            <input type="email" id="email" name="email" class="theme-input-style"
                                placeholder="{{ translate('Email Address') }}" value="{{ old('email') }}">
                            @if ($errors->has('email'))
                                <div class="text-danger mt-2">{{ $errors->first('email') }}</div>
                            @endif
                        </div>
                        <!-- End Form Group -->

                        <!-- Form Group -->
                        <div class="form-group mb-20">
                            <label for="password" class="mb-2 font-14 bold black">{{ translate('Password') }}</label>
                            <input type="password" id="password" name="password" class="theme-input-style"
                                placeholder="{{ translate('********') }}">
                            @if ($errors->has('password'))
                                <div class="text-danger mt-2">{{ $errors->first('password') }}</div>
                            @endif
                        </div>
                        <!-- End Form Group -->

                        <div class="d-flex justify-content-between mb-20">
                            <a href="{{ route('core.password.reset.link') }}"
                                class="font-12 text_color">{{ translate('Forgot Password?') }}</a>
                        </div>

                        <div class="d-flex align-items-center">
                            <button type="submit" class="btn long mr-20">{{ translate('Log In') }}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- End Card -->
    </div>
@endsection