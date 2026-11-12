@push('head')
    {{-- Push custom script or style into head tag --}}
    <style>
        .state-icon {
            width: 100%;
            height: 50px;
        }

        .summary-card {
            background: url('/public/backend/assets/img/summery-bg1.png');
            background-size: auto
        }

        .overflow-text {
            display: block;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .dash-image {
            width: 45px;
            height: 45px;
            object-fit: cover;
        }

        .order-couter-item {
            padding: 13px 0px;
        }

        .apexcharts-toolbar {
            top: -30px !important;
        }

        .img-20 {
            width: 20px !important;
            height: 20px !important;
        }

        .comment_img {
            max-width: 30px;
        }

        .popular-categories {
            height: 403px;
        }

        .most-viwed-post {
            height: 402px;
        }

        .latest-members-table {
            height: 365px;
        }

        .latest-page {
            height: 402px;
        }

        .apexcharts-svg {
            transform: translate(5px, -10px);
        }

        .pie-chart .apexcharts-inner.apexcharts-graphical {
            transform: translate(21%, 0%);
        }


        @media only screen and (max-width: 1440px) {
            .pie-chart .apexcharts-inner.apexcharts-graphical {
                transform: translate(12%, 0%);
            }
        }

        @media only screen and (max-width: 375px) {
            .pie-chart .apexcharts-inner.apexcharts-graphical {
                transform: translate(10%, 0%);
            }
        }

        .apexcharts-pie-label {
            fill: white;
        }
    </style>
@endpush

<div class="row">

    <!-- Count Card -->
    <div class="col-xl-3 col-sm-6">
        <div class="card mb-30">
            <div class="state">
                <div class="d-flex align-items-center flex-wrap">
                    <div class="state-icon d-flex justify-content-center">
                        <img src="{{ asset('public/backend/assets/img/svg/blog.svg') }}" alt="">
                    </div>
                    <div class="state-content">
                        <p class="font-14 mb-2">{{ translate('Total Posts') }}</p>
                        <h3>{{ $total_blog }}</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-sm-6">
        <div class="card mb-30">
            <div class="state">
                <div class="d-flex align-items-center flex-wrap">
                    <div class="state-icon d-flex justify-content-center">
                        <img src="{{ asset('public/backend/assets/img/svg/c-edit.svg') }}" alt="">
                    </div>
                    <div class="state-content">
                        <p class="font-14 mb-2">{{ translate('Total Pages') }}</p>
                        <h3>{{ $total_pages }}</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-sm-6">
        <div class="card mb-30">
            <div class="state">
                <div class="d-flex align-items-center flex-wrap">
                    <div class="state-icon d-flex justify-content-center">
                        <img src="{{ asset('public/backend/assets/img/svg/user2.svg') }}" alt="">
                    </div>
                    <div class="state-content">
                        <p class="font-14 mb-2">{{ translate('Total Members') }}</p>
                        <h3>{{ $total_members }}</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xl-3 col-sm-6">
        <div class="card mb-30">
            <div class="state">
                <div class="d-flex align-items-center flex-wrap">
                    <div class="state-icon d-flex justify-content-center">
                        <img src="{{ asset('public/backend/assets/img/svg/chat.svg') }}" alt="">
                    </div>
                    <div class="state-content">
                        <p class="font-14 mb-2">{{ translate('Total Comments') }}</p>
                        <h3>{{ $total_comment }}</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Count Card End -->

    <!--Visitor Reports-->
    <div class="col-lg-8 col-md-12">
        <div class="card mb-30">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-start align-items-sm-center media">
                    <div
                        class="d-flex justify-content-start justify-content-sm-between align-items-start align-items-sm-center flex-column flex-sm-row mb-sm-n3  media-body">
                        <div class="title-content mb-4 mr-sm-5 mb-sm-0">
                            <h4 class="">{{ translate('Visitors Reports') }}</h4>
                        </div>
                        <!-- List Button -->
                        <ul class="list-inline list-button m-0 mr-sm-4">
                            <li class="active chart-switcher" data-type="monthly">{{ translate('Monthly') }}</li>
                            <li class="chart-switcher" data-type="daily">{{ translate('Daily') }}</li>
                        </ul>
                        <!-- End List Button -->
                    </div>
                </div>
            </div>
            <div id="apex_sales_report_chart"></div>
        </div>
    </div>
    <!--End Visitor Reports-->

    <!--Post Counter-->
    <div class="col-lg-4 col-md-6">
        <!-- Card -->
        <div class="card mb-30">
            <div class="card-body p-30">
                <div class="d-flex justify-content-between">
                    <div class="title-content">
                        <h4 class="mb-2">{{ translate('Post Status') }}</h4>
                    </div>
                </div>
                <div class="trans-history py-3">
                    <div class="align-items-center border-bottom d-flex justify-content-between mb-2 order-couter-item">
                        <div class="d-flex align-items-center">
                            <div class="img mr-3">
                                <i class="icofont-tick-boxed font-20"></i>
                            </div>
                            <div class="content">
                                <a href="{{ route('core.blog') . '?status=publish' }}">
                                    <h5>{{ translate('Published') }}</h5>
                                </a>
                            </div>
                        </div>
                        <div>
                            <h5>{{ $publish_blog }}</h5>
                        </div>
                    </div>
                    <div class="align-items-center border-bottom d-flex justify-content-between mb-2 order-couter-item">
                        <div class="d-flex align-items-center">
                            <div class="img mr-3">
                                <i class="icofont-clock-time font-20"></i>
                            </div>
                            <div class="content">
                                <a href="{{ route('core.blog') . '?status=schedule' }}">
                                    <h5>{{ translate('Scheduled') }}</h5>
                                </a>
                            </div>
                        </div>
                        <div>
                            <h5>{{ $scheduled_blog }}</h5>
                        </div>
                    </div>
                    <div class="align-items-center border-bottom d-flex justify-content-between mb-2 order-couter-item">
                        <div class="d-flex align-items-center">
                            <div class="img mr-3">
                                <i class="icofont-page font-20"></i>
                            </div>
                            <div class="content">
                                <a href="{{ route('core.blog') . '?status=draft' }}">
                                    <h5>{{ translate('Drafts') }}</h5>
                                </a>
                            </div>
                        </div>
                        <div class="">
                            <h5>{{ $draft_blog }}</h5>
                        </div>
                    </div>
                    <div class="align-items-center border-bottom d-flex justify-content-between mb-2 order-couter-item">
                        <div class="d-flex align-items-center">
                            <div class="img mr-3">
                                <i class="icofont-ui-laoding font-20"></i>
                            </div>
                            <div class="content">
                                <a href="{{ route('core.blog') . '?status=pending' }}">
                                    <h5>{{ translate('Pending') }}</h5>
                                </a>
                            </div>
                        </div>
                        <div>
                            <h5>{{ $pending_blog }}</h5>
                        </div>
                    </div>
                    <div class="align-items-center border-bottom d-flex justify-content-between mb-2 order-couter-item">
                        <div class="d-flex align-items-center">
                            <div class="img mr-3">
                                <i class="icofont-blogger font-20"></i>
                            </div>
                            <div class="content">
                                <a href="{{ route('core.blog') . '?status=featured' }}">
                                    <h5>{{ translate('Featured') }}</h5>
                                </a>
                            </div>
                        </div>
                        <div>
                            <h5>{{ $featured_blog }}</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Card -->
    </div>
    <!--End order counter-->

    <!-- Top Countries Reports-->
    <div class="col-lg-4 col-md-6">
        <!-- Card -->
        <div class="card mb-30">
            <div class="card-body mb-3 mb-xl-0">
                <div class="d-sm-flex justify-content-between">
                    <div class="title-content mb-4 mb-sm-0">
                        <h4 class="mb-2">{{ translate('Top Countries') }}</h4>
                    </div>
                    <!-- List Button -->
                    <ul class="list-inline list-button m-0 mr-sm-4">
                        <li class="active country-switcher" data-type="monthly">{{ translate('This Month') }}</li>
                        <li class="country-switcher" data-type="daily">{{ translate('Today') }}</li>
                    </ul>
                    <!-- End List Button -->
                </div>
            </div>
            <div id="apex_pie-chart" class="pie-chart"></div>
        </div>
        <!-- End Card -->
    </div>
    <!-- Top Countries  Reports-->

    <!-- Top Browser Reports-->
    <div class="col-lg-4 col-md-6">
        <!-- Card -->
        <div class="card mb-30">
            <div class="card-body mb-3 mb-xl-0">
                <div class="d-sm-flex justify-content-between">
                    <div class="title-content mb-4 mb-sm-0">
                        <h4 class="mb-2">{{ translate('Top Browser') }}</h4>
                    </div>
                    <!-- List Button -->
                    <ul class="list-inline list-button m-0 mr-sm-4">
                        <li class="active browser-switcher" data-type="monthly">{{ translate('This Month') }}</li>
                        <li class="browser-switcher" data-type="daily">{{ translate('Today') }}</li>
                    </ul>
                    <!-- End List Button -->
                </div>
            </div>
            <div id="browser_apex_pie-chart" class="pie-chart"></div>
        </div>
        <!-- End Card -->
    </div>
    <!-- Top Browser Reports-->

    <!-- Top Device Reports-->
    <div class="col-lg-4 col-md-6">
        <div class="card mb-30">
            <div class="card-body mb-3 mb-xl-0">
                <div class="d-sm-flex justify-content-between">
                    <div class="title-content mb-4 mb-sm-0">
                        <h4 class="mb-2">{{ translate('Top Device') }}</h4>
                    </div>
                    <!-- List Button -->
                    <ul class="list-inline list-button m-0 mr-sm-4">
                        <li class="active device-switcher" data-type="monthly">{{ translate('This Month') }}</li>
                        <li class="device-switcher" data-type="daily">{{ translate('Today') }}</li>
                    </ul>
                    <!-- End List Button -->
                </div>
            </div>
            <div id="device_apex_pie-chart" class="pie-chart"></div>
        </div>
    </div>
    <!-- Top Device Reports-->

    <!-- Latest Members -->
    <div class="col-lg-6">
        <!-- Card -->
        <div class="card mb-30">
            <div class="card-body pb-0">
                <div class="d-flex align-items-start align-items-sm-end justify-content-between">
                    <div class="">
                        <h4>{{ translate('Latest Members') }}</h4>
                    </div>
                </div>
            </div>
            <div class="table-responsive latest-members-table">
                <table class="style--three table-centered text-nowrap">
                    <thead>
                        <tr>
                            <th>{{ translate('Member') }}</th>
                            <th>{{ translate('Joined At') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @if (count($latest_members) > 0)
                            @foreach ($latest_members as $member)
                                <tr>
                                    <td class="py-2">
                                        <div class="d-flex align-items-center">
                                            <div class="img mr-3">
                                                <img src="{{ userImage($member) }}" alt="{{ $member->name }}"
                                                    class="dash-image">
                                            </div>
                                            <div class="content">
                                                <span>{{ $member->name }}</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="py-2">
                                        {{ date('d-m-Y h:m A', strtotime($member->created_at)) }}
                                    </td>
                                </tr>
                            @endforeach
                        @else
                            <tr>
                                <td colspan="5">
                                    <p class="alert alert-danger text-center">{{ translate('Nothing found') }}</p>
                                </td>
                            </tr>
                        @endif
                    </tbody>
                </table>
            </div>
        </div>
        <!-- End Card -->
    </div>
    <!--End Latest Members -->

    <!-- Most Viewed Post -->
    <div class="col-lg-6">
        <div class="card mb-30">
            <div class="card-body most-viwed-post">
                <div class="d-flex align-items-start align-items-sm-end justify-content-between mb-3">
                    <div class="">
                        <h4 class="mb-1">{{ translate('Most Viewed Post') }}</h4>
                    </div>
                </div>
                <div class="product-list">
                    @if (count($most_viewed) > 0)
                        @foreach ($most_viewed as $post)
                            <div class="mb-20 d-flex justify-content-between align-items-center">
                                <div class="d-flex align-items-center">
                                    <div class="img mr-3">
                                        <img src="{{ getFilePath($post->image, true) }}"
                                            alt="{{ $post->name }}" class="dash-image">
                                    </div>
                                    <div class="content">
                                        @php
                                            $name = $post->translation('name', getLocale());
                                        @endphp
                                        <a
                                            href="{{ route('core.edit.blog', ['id' => $post->id, 'lang' => getDefaultLang()]) }}">{{ strlen($name) > 35 ? mb_substr($name, 0, 35, 'UTF-8') . '...' : $name }}</a>
                                    </div>
                                </div>
                                <p class="font-14">{{ $post->views }} views</p>
                            </div>
                        @endforeach
                    @else
                        <p class="alert alert-danger text-center">{{ translate('Nothing Found') }}</p>
                    @endif
                </div>
            </div>
        </div>
    </div>
    <!-- End Most Viewed Post -->

    <!--Recent comments-->
    <div class="col-xl-8 col-lg-7 col-12 mb-20">
        <!-- Card -->
        <div class="card">
            <div class="card-body pb-0">
                <div class="d-flex justify-content-between">
                    <div class="title-content">
                        <h4 class="mb-2">{{ translate('Recent Comments') }}</h4>
                    </div>
                </div>
            </div>
            <div class="table-responsive">
                <table class="style--three table-centered text-nowrap">
                    <thead>
                        <tr>
                            <th>{{ translate('Author') }}</th>
                            <th>{{ translate('Comment') }}</th>
                            <th>{{ translate('Post') }}</th>
                            <th>{{ translate('Submitted on') }}</th>
                        </tr>
                    </thead>
                    <tbody>
                        @if (count($recent_comments) > 0)
                            @foreach ($recent_comments as $comment)
                                <tr class="comment_list">
                                    <td class="d-flex align-itmes-center vtop py-2">
                                        @php
                                            $comment_setting = commentFormSettings();
                                            $author = Core\Models\User::where('id', $comment->user_id)->first();

                                            $author_image = $comment->user_type == 'admin' || $comment->user_type == 'user' ? userImage($comment->user) : null;
                                            $author_name = $comment->user_type == 'admin' || $comment->user_type == 'user' ? $comment->user->name : null;

                                            $author_name = isset($author_name) ? $author_name : $comment->user_name;

                                            $author_email = $comment->user_type == 'admin' || $comment->user_type == 'user' ? $author->email : $comment->user_email;
                                        @endphp
                                        <div class="d-inline">
                                            <img src="
                                                @if (isset($author_image)) {{ $author_image }}
                                                @else
                                                    @if ($comment_setting['show_avatars'] == 1)
                                                        {{ asset('/public/comment-author-image/' . $comment_setting['avatar_default'] . '.png') }}
                                                    @else
                                                        {{ getFilePath($author_image) }} @endif
                                                @endif"
                                                alt="" class="comment_img">
                                        </div>
                                        <div class="d-inline-block ml-2">
                                            <span>
                                                {{ $author_name }}
                                            </span>
                                            <br>

                                            @if (isset($author_email))
                                                <a href="javascript:void(0)" class="text-primary">
                                                    {{ $author_email }}
                                                </a>
                                                <br>
                                            @else
                                                @if ($comment->user_email != '')
                                                    <a href="javascript:void(0)" class="text-primary">
                                                        {{ $comment->user_email }}
                                                    </a>
                                                    <br>
                                                @endif
                                            @endif
                                            <br>

                                            <a href="{{ route('core.blog.comment') . '?status=user_ip_address&ip_address=' . $comment->user_ip_address }}"
                                                class="text-primary">{{ $comment->user_ip_address }}</a>
                                        </div>
                                    </td>
                                    <td class="vtop py-2">
                                        @if (isset($comment->parent))
                                            @php
                                                $parent_comment = Core\Models\TlBlogComment::where('id', $comment->parent)->first()->user_name;
                                            @endphp
                                            <span class="d-block mb-1">{{ translate('In reply to') }}
                                                <a href="javascript:void(0)"
                                                    class="text-primary">{{ $parent_comment }}</a>
                                            </span>
                                        @endif
                                        <span class="d-block mb-1">{{ $comment->comment }}</span>
                                    </td>
                                    <td class="py-2">
                                        @php
                                            $blog = $comment->blog->translation('name', getLocale());
                                        @endphp
                                        <a
                                            href="{{ route('theme.newslooks.blog.details', ['permalink' => $comment->blog->permalink]) }}">{{ strlen($blog) > 20 ? mb_substr($blog, 0, 20, 'UTF-8') . '...' : $blog }}</a>
                                    </td>
                                    <td class="vtop py-2">
                                        <span>{{ getFormatedDateTime($comment->comment_date, 'Y/m/d \a\t H:i a') }}</span>
                                    </td>
                                </tr>
                            @endforeach
                        @else
                            <tr>
                                <td colspan="5">
                                    <p class="alert alert-danger text-center">{{ translate('Nothing found') }}</p>
                                </td>
                            </tr>
                        @endif
                    </tbody>
                </table>
            </div>
        </div>
        <!-- End Card -->
    </div>
    <!--End recents comments-->

    <!-- Popular Categories -->
    <div class="col-xl-4 col-lg-5">
        <div class="card mb-30">
            <div class="card-body popular-categories">
                <div class="d-flex align-items-start align-items-sm-end justify-content-between mb-3">
                    <div class="">
                        <h4 class="mb-1">{{ translate('Popular Categories') }}</h4>
                    </div>
                </div>
                <div class="product-list">
                    @if (count($popular_categories) > 0)
                        @foreach ($popular_categories as $category)
                            @if ($category->blog_count > 0)
                                <div class="mb-20 d-flex justify-content-between align-items-center">
                                    <div class="d-flex align-items-center">
                                        <div class="content">
                                            @php
                                                $name = $category->translation('name', getLocale());
                                            @endphp
                                            <a
                                                href="{{ route('core.edit.blog.category', ['id' => $category->id, 'lang' => getDefaultLang()]) }}">{{ $name }}</a>
                                        </div>
                                    </div>
                                    <p class="font-14">{{ $category->blog_count . ' ' . translate('Post') }}</p>
                                </div>
                            @endif
                        @endforeach
                    @else
                        <p class="alert alert-danger text-center">{{ translate('Nothing Found') }}</p>
                    @endif
                </div>
            </div>
        </div>
    </div>
    <!--End Popular Categories-->

    <!--Recent Posts-->
    <div class="col-lg-6">
        <!-- Card -->
        <div class="card mb-30">
            <div class="card-body">
                <div class="d-flex align-items-start align-items-sm-end justify-content-between mb-3">
                    <div class="">
                        <h4 class="mb-1">{{ translate('Latest Posts') }}</h4>
                    </div>
                </div>
                <div class="product-list">
                    @if (count($latest_blogs) > 0)
                        @foreach ($latest_blogs as $blog)
                            <div class="mb-20 d-flex justify-content-between align-items-center">
                                <div class="d-flex align-items-center">
                                    <div class="img mr-3">
                                        <img src="{{ getFilePath($blog->image, true) }}"
                                            alt="{{ $blog->name }}" class="dash-image">
                                    </div>
                                    <div class="content">
                                        @php
                                            $name = $blog->translation('name', getLocale());
                                        @endphp
                                        <a
                                            href="{{ route('core.edit.blog', ['id' => $blog->id, 'lang' => getDefaultLang()]) }}">{{ strlen($name) > 35 ? mb_substr($name, 0, 35, 'UTF-8') . '...' : $name }}</a>
                                    </div>
                                </div>
                                <p class="font-14">{{ date('d-m-Y h:m A', strtotime($blog->publish_at)) }}</p>
                            </div>
                        @endforeach
                    @else
                        <p class="alert alert-danger text-center">{{ translate('Nothing Found') }}</p>
                    @endif
                </div>
            </div>
        </div>
        <!-- End Card -->
    </div>
    <!--End Recent Posts-->

    <!--Recent Pages-->
    <div class="col-lg-6">
        <div class="card mb-30">
            <div class="card-body latest-page">
                <div class="d-flex align-items-start align-items-sm-end justify-content-between mb-3">
                    <div class="">
                        <h4 class="mb-1">{{ translate('Latest Pages') }}</h4>
                    </div>
                </div>
                <div class="product-list">
                    @if (count($latest_pages) > 0)
                        @foreach ($latest_pages as $page)
                            <div class="mb-20 d-flex justify-content-between align-items-center">
                                <div class="d-flex align-items-center">
                                    <div class="content">
                                        @php
                                            $name = $page->translation('title', getLocale());
                                        @endphp
                                        <a
                                            href="{{ route('core.edit.blog', ['id' => $page->id, 'lang' => getDefaultLang()]) }}">{{ strlen($name) > 35 ? mb_substr($name, 0, 35, 'UTF-8') . '...' : $name }}</a>
                                    </div>
                                </div>
                                <p class="font-14">{{ date('d-m-Y h:m A', strtotime($page->publish_at)) }}</p>
                            </div>
                        @endforeach
                    @else
                        <p class="alert alert-danger text-center">{{ translate('Nothing Found') }}</p>
                    @endif
                </div>
            </div>
        </div>
    </div>
    <!--End Recent Pages-->
</div>

@push('script')
    <script>
        (function($) {
            "use strict";

            /*==================================
                Visitor Report
            ====================================*/
            let chart_data_type = "monthly";
            let categories = [];
            //change chart data type
            $(".chart-switcher").on('click', function(e) {
                e.preventDefault();
                $('.chart-switcher').removeClass('active');
                $(this).addClass('active');
                chart_data_type = $(this).data('type');
                getChartData();
            });

            //Get data from api
            function getChartData() {
                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                    },
                    type: "POST",
                    data: {
                        type: chart_data_type
                    },
                    url: "{{ route('theme.newslooks.visitor.reports') }}",
                    success: function(data) {
                        if (data.success) {
                            categories = data.times;
                            sales_chart.updateSeries([{
                                name: 'Visitors',
                                data: data.visitors
                            }])

                            sales_chart.updateOptions({
                                xaxis: {
                                    categories: data.times
                                }
                            })
                        }
                    }
                });
            }
            //chart options
            let sales_chart_options = {
                series: [],
                chart: {
                    height: 340,
                    type: 'line',
                    toolbar: {
                        show: true,
                    },
                    zoom: {
                        enabled: false
                    }
                },
                dataLabels: {
                    enabled: false
                },
                stroke: {
                    curve: 'smooth',
                    width: 3,
                    dashArray: 3
                },
                colors: ['#FFBA5A', '#8381FD'],
                grid: {
                    borderColor: '#f5f5f5',
                },
                markers: {
                    size: 7,
                    colors: ["#67CF94"],
                    hover: {
                        size: 8,
                    }
                },
                xaxis: {
                    categories: [],
                },
                yaxis: {
                    tickAmount: 4,
                },
                responsive: [{
                    breakpoint: 576,
                    options: {
                        markers: {
                            size: 5,
                            colors: ["#67CF94"],
                            hover: {
                                size: 5,
                            }
                        },
                    }
                }],
            };
            //Render chart
            let sales_chart = new ApexCharts(document.querySelector("#apex_sales_report_chart"), sales_chart_options);
            sales_chart.render();



            /*==================================
            Pie Chart For Country Visit
            ====================================*/
            let country_data_type = "monthly";
            $(".country-switcher").on('click', function(e) {
                e.preventDefault();
                $('.country-switcher').removeClass('active');
                $(this).addClass('active');
                country_data_type = $(this).data('type');

                getCountryData();
            });

            //Get data from api
            function getCountryData() {
                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                    },
                    type: "POST",
                    data: {
                        type: country_data_type
                    },
                    url: "{{ route('theme.newslooks.country.reports') }}",
                    success: function(data) {
                        pie_chart.updateOptions({
                            series: data.percentage,
                            labels: data.countries
                        })
                    }
                });
            }

            let pie_options = {
                series: [],
                chart: {
                    width: 100 + "%",
                    height: 500,
                    type: 'pie',
                    offsetY: -35,
                    offsetX: 5,
                },
                colors: ["#00529B", "#377B2B", "#F54F52", "#7CDDDD", '#FF00FE'],
                dataLabels: {
                    enabled: true,
                    style: {
                        fontSize: '11px',
                        colors: ['#000000'],
                    },
                    background: {
                        enabled: false,
                    },
                },
                states: {
                    hover: {
                        filter: {
                            type: 'darken',
                            value: 0.80,
                        }
                    },
                },
                legend: {
                    position: 'bottom',
                    offsetY: -10,
                    fontSize: '12px',
                    fontFamily: '"PT Sans", sans-serif',
                    labels: {
                        colors: "#727272"
                    },
                    itemMargin: {
                        horizontal: 4,
                        //vertical: 20
                    },
                    markers: {
                        width: 17,
                        height: 11,
                        radius: 0,
                    },
                },
                plotOptions: {
                    pie: {
                        customScale: 1,
                        offsetY: 25,
                        offsetX: 10,
                    }
                },
                labels: [],
                responsive: [{
                    breakpoint: 1760,
                    options: {
                        chart: {
                            height: 340,
                        },
                        plotOptions: {
                            pie: {
                                customScale: 1,
                                offsetX: 0,
                            }
                        }
                    }
                }],
            };

            let pie_chart = new ApexCharts(document.querySelector("#apex_pie-chart"), pie_options);
            pie_chart.render();

            /*==================================
                Pie Chart For Browser Visit
            ====================================*/
            let browser_data_type = "monthly";
            $(".browser-switcher").on('click', function(e) {
                e.preventDefault();
                $('.browser-switcher').removeClass('active');
                $(this).addClass('active');
                browser_data_type = $(this).data('type');

                getBrowserData();
            });

            //Get data from api
            function getBrowserData() {
                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                    },
                    type: "POST",
                    data: {
                        type: browser_data_type
                    },
                    url: "{{ route('theme.newslooks.browser.reports') }}",
                    success: function(data) {
                        browser_pie_chart.updateOptions({
                            series: data.percentage,
                            labels: data.browsers
                        })
                    }
                });
            }

            let browser_pie_options = {
                series: [],
                chart: {
                    width: 100 + "%",
                    height: 500,
                    type: 'pie',
                    offsetY: -35,
                    offsetX: 5,
                },
                colors: ["#00529B", "#377B2B", "#F54F52", "#7CDDDD", '#FF00FE'],
                dataLabels: {
                    enabled: true,
                    style: {
                        fontSize: '11px',
                        colors: ['#000000'],
                    },
                    background: {
                        enabled: false,
                    },
                },
                states: {
                    hover: {
                        filter: {
                            type: 'darken',
                            value: 0.80,
                        }
                    },
                },
                legend: {
                    position: 'bottom',
                    offsetY: -10,
                    fontSize: '12px',
                    fontFamily: '"PT Sans", sans-serif',
                    labels: {
                        colors: "#727272"
                    },
                    itemMargin: {
                        horizontal: 4,
                    },
                    markers: {
                        width: 17,
                        height: 11,
                        radius: 0,
                    },
                },
                plotOptions: {
                    pie: {
                        customScale: 1,
                        offsetY: 25,
                        offsetX: 10,
                    }
                },
                labels: [],
                responsive: [{
                    breakpoint: 1760,
                    options: {
                        chart: {
                            height: 340,
                        },
                        plotOptions: {
                            pie: {
                                customScale: 1,
                                offsetX: 0,
                            }
                        }
                    }
                }],
            };

            let browser_pie_chart = new ApexCharts(document.querySelector("#browser_apex_pie-chart"),
                browser_pie_options);
            browser_pie_chart.render();

            /*==================================
                Pie Chart For Device Visit
             ====================================*/
            let device_data_type = "monthly";
            $(".device-switcher").on('click', function(e) {
                e.preventDefault();
                $('.device-switcher').removeClass('active');
                $(this).addClass('active');
                device_data_type = $(this).data('type');

                getDeviceData();
            });

            //Get data from api
            function getDeviceData() {
                $.ajax({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                    },
                    type: "POST",
                    data: {
                        type: device_data_type
                    },
                    url: "{{ route('theme.newslooks.device.reports') }}",
                    success: function(data) {
                        device_pie_chart.updateOptions({
                            series: data.percentage,
                            labels: data.devices
                        });
                    }
                });
            }

            let device_pie_options = {
                series: [],
                chart: {
                    width: 100 + "%",
                    height: 500,
                    type: 'pie',
                    offsetY: -35,
                    offsetX: 5,
                },
                colors: ["#00529B", "#377B2B", "#F54F52", "#7CDDDD", '#FF00FE'],
                dataLabels: {
                    enabled: true,
                    style: {
                        fontSize: '11px',
                        colors: ['#000000'],
                    },
                    background: {
                        enabled: false,
                    },
                },
                states: {
                    hover: {
                        filter: {
                            type: 'darken',
                            value: 0.80,
                        }
                    },
                },
                legend: {
                    position: 'bottom',
                    offsetY: -10,
                    fontSize: '12px',
                    fontFamily: '"PT Sans", sans-serif',
                    labels: {
                        colors: "#727272"
                    },
                    itemMargin: {
                        horizontal: 4,
                    },
                    markers: {
                        width: 17,
                        height: 11,
                        radius: 0,
                    },
                },
                plotOptions: {
                    pie: {
                        customScale: 1,
                        offsetY: 25,
                        offsetX: 10,
                    }
                },
                labels: [],
                responsive: [{
                    breakpoint: 1760,
                    options: {
                        chart: {
                            height: 340,
                        },
                        plotOptions: {
                            pie: {
                                customScale: 1,
                                offsetX: 0,
                            }
                        }
                    }
                }],
            };

            let device_pie_chart = new ApexCharts(document.querySelector("#device_apex_pie-chart"),
                device_pie_options);
            device_pie_chart.render();

            $(document).ready(function() {
                getChartData();
                getCountryData();
                getBrowserData();
                getDeviceData();
            });

        })(jQuery);
    </script>
@endpush
