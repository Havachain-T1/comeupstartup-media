@extends('core::base.auth.auth_layout')
@section('title')
    {{ translate('Try Forgot Password') }}
@endsection
@section('main_content')
    <div class="row align-items-center justify-content-center mn-vh-100">
        <!-- Card -->
        <div class="card justify-content-center p-5">
            <div class="row justify-content-center">
                <div class="col-12">
                    <h4 class="mb-5 font-20">{{ translate('Reset Password') }}</h4>
                    <form action="{{ route('core.email.reset.password.link') }}" method="post">
                        @csrf
                        <!-- Form Group -->
                        <div class="form-group mb-20">
                            <label for="email" class="mb-2 font-14 bold black">{{ translate('Email') }}</label>
                            <input type="email" id="email" name="email" class="theme-input-style"
                                placeholder="{{ translate('Email Address') }}">
                            @if ($errors->has('email'))
                                <div class="invalid-input">{{ $errors->first('email') }}</div>
                            @endif
                        </div>
                        <!-- End Form Group -->

                        <div class="d-flex align-items-center">
                            <button type="submit"
                                class="btn long mr-20">{{ translate('Send Password Reset Link') }}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- End Card -->
    </div>
@endsection
