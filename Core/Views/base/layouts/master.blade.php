@php
    $chink_size_object = getChunkSize();
    $chink_size = 256000000;
    if ($chink_size_object != null) {
        $chink_size = $chink_size_object->value;
    }
    
    $placeholder_info = getPlaceHolderImage();
    $placeholder_image = $placeholder_info != null ? $placeholder_info->placeholder_image : '';
    
    $logo_details = getGeneralSettingsDetails();
@endphp
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Page Title -->
    <title>@yield('title') | {{ $logo_details['system_name'] }}</title>
    <meta name="_token" content="{{ csrf_token() }}">
    <!-- Meta Data -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keywords" content="">

    <!-- Favicon -->
    <link rel="shortcut icon"
        href="{{ isset($logo_details['favicon']) ? $logo_details['favicon'] : '' }}">

    <!-- Web Fonts -->
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:400,400i,700,700i&display=swap" rel="stylesheet">

    <!-- ======= BEGIN GLOBAL MANDATORY STYLES ======= -->
    <link rel="stylesheet" href="{{ asset('/public/backend/assets/bootstrap/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('/public/backend/assets/fonts/icofont/icofont.min.css') }}">
    <link rel="stylesheet"
        href="{{ asset('/public/backend/assets/plugins/perfect-scrollbar/perfect-scrollbar.min.css') }}">
    <!-- ======= END BEGIN GLOBAL MANDATORY STYLES ======= -->

    <!-- ======= TOASTER CSS======= -->
    <link rel="stylesheet" href="{{ asset('/public/backend/assets/css/toaster.min.css') }}">
    <!-- ======= TOASTER CSS======= -->

    <!-- ======= BEGIN PAGE LEVEL PLUGINS STYLES ======= -->
    <link rel="stylesheet" href="{{ asset('/public/backend/assets/plugins/sweetalert2/sweetalert2.min.css') }}">
    <!-- ======= END BEGIN PAGE LEVEL PLUGINS STYLES ======= -->

    <!-- Dropzone-->
    <link rel="stylesheet" href="{{ asset('/public/backend/assets/plugins/dropzone/dropzone.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('/public/backend/assets/plugins/daterangepicker/daterangepicker.css') }}">

    @yield('custom_css')
    <!-- ======= MAIN STYLES ======= -->
    <link rel="stylesheet" href="{{ asset('/public/backend/assets/css') }}/{{ $style_path }}/style.css">
    <link rel="stylesheet" href="{{ asset('/public/backend/assets/css/custom.css') }}">
    <!-- ======= END MAIN STYLES ======= -->
    @stack('head')
    <style>
       #multiselectMediaWrapper {
            padding: 8px 17px;
            border: 1px solid gray;
        }

        div#multiselectMediaWrapper.active {
            background: #6045e2 !important;
            color: #fff;
            border-color: #6045e2 !important;
        }
    </style>
</head>

<body>

    <!-- Offcanval Overlay -->
    <div class="offcanvas-overlay"></div>
    <!-- Offcanval Overlay -->

    <!-- Wrapper -->
    <div class="wrapper">
        <!-- Header -->
        @include('core::base.layouts.header')
        <!-- End Header -->

        <!-- Main Wrapper -->
        <div class="main-wrapper">
            <!-- Sidebar -->
            @include('core::base.layouts.navbar')
            <!-- End Sidebar -->

            <!-- Main Content -->
            <div class="main-content">
                <div class="container-fluid">
                    @yield('main_content')
                </div>
            </div>
            <!-- End Main Content -->
        </div>
        <!-- End Main Wrapper -->

        <!-- Footer -->
        @include('core::base.layouts.footer')
        <!-- End Footer -->
    </div>
    <!-- End wrapper -->
    @include('core::base.layouts.script')
</body>

</html>