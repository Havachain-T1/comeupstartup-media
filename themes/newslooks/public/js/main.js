/*---------------------------------------------
Template name:  CaNews - Multipurpose News, Magazine and Blog HTML5 Template
Version:        1.0
Author:         themelooks
Author url:     https://themelooks.com

NOTE:
------
Please DO NOT EDIT THIS JS, you may need to use "custom.js" file for writing your custom js.
We may release future updates so it will overwrite this file. it's better and safer to use "custom.js".

[Table of Content]
    01: Background Image
    02: Offcanvas
    03: Vertical Dropdown Menu
    04: Header Sticky
    05: Preloader
    06: Contact Form
    07: Offcanvas Margin
    08: Marquee
    09: Update Current Date
    10: Ajax Load
    11: Back to Top
    12: Swiper Slider
    13: Support for SVG
    14: Dropdown
    15: Progress
    16: Magnific Popup
    17: Google map 
    18: Contact Form
    19: Countdown Timer
    20: Slider Range
    21: Elevate Zoom Active
    22: Increase/Decrease Product Quantity
    23: Tab
----------------------------------------------*/

(function ($) {
    /* 01: Background Image
    ============================================== */
    const $bgImg = $('[data-bg-img]');
    $bgImg
        .css('background-image', function () {
            return `url("${$(this).data('bg-img')}")`;
        })
        .removeAttr('data-bg-img')
        .addClass('bg-img');

    /* 02: Offcanvas
    ============================================== */
    // Open
    function openOffCanvas(target) {
        const $target = $(target);
        const $trigger = $(`[data-target = ${$target.attr('id')}]`);

        if (!$target.length) {
            return false;
        }

        $trigger.addClass('active');
        $target.addClass('open');

        $(document.body).addClass(
            `offcanvas-opened ${$target.attr('id')}-opened`
        );
        return true;
    }

    // Close
    function closeOffCanvas(target) {
        let $offcanvas;
        if ($(target).hasClass('.offcanvas')) {
            $offcanvas = target;
        } else {
            $offcanvas = $(target).closest('.offcanvas');
        }

        const $trigger = $(`[data-target = ${$offcanvas.attr('id')}]`);

        $trigger.removeClass('active');
        $offcanvas.removeClass('open');
        $(document.body).removeClass(
            `offcanvas-opened ${$offcanvas.attr('id')}-opened`
        );
    }

    // Toggle
    function offcanvasToggle() {
        $(document.body).on('click', '[data-toggle="offCanvas"]', function (e) {
            const target = `#${$(this).data('target')}`;

            if ($(target).hasClass('open')) {
                closeOffCanvas(target);
            } else if (openOffCanvas(target)) {
                e.preventDefault();
            }
        });

        $('.close-offcanvas').on('click', function () {
            closeOffCanvas(this);
        });

        $('.offcanvas').on('click', function (e) {
            if (e.target === e.currentTarget) {
                closeOffCanvas(this);
            }
        });
    }

    offcanvasToggle();

    /* 03: Vertical Dropdown Menu
    ============================================== */
    function verticalDropdownMenu() {
        const $menu = $('.vertical-menu');

        $menu
            .find('ul li')
            .parents('.vertical-menu ul li')
            .addClass('has-sub-item')
            .prepend(
                '<span class="submenu-button d-inline-flex align-items-center justify-content-center"></span>'
            );
        $menu.find('.submenu-button').on('click', function () {
            $(this).parent().toggleClass('menu-group-opened');
            $(this).toggleClass('open');
            if ($(this).siblings('ul').hasClass('open')) {
                $(this).siblings('ul').removeClass('open').slideUp('fast');
            } else {
                $(this).siblings('ul').addClass('open').slideDown('fast');
            }
        });
    }
    verticalDropdownMenu();

    /* 04: Header Sticky
    ============================================== */
    const stickyH = $('[data-sticky]');
    if (stickyH.length) {
        stickyH.wrap("<div class='sticky-wrapper'></div>");

        const stickyWrapper = $('.sticky-wrapper');
        $(window).on('scroll', function () {
            const scroll = $(window).scrollTop();
            if (scroll < stickyWrapper.offset().top) {
                stickyH.removeClass('fixed-top animated fadeInDown');
            } else {
                stickyH.addClass('fixed-top animated fadeInDown');
            }
        });
    }

    /* 05: Preloader
    ============================================== */
    if ($('.preloader').length) {
        $('body').addClass('overflow-hidden');
    }
    $(window).on('load', function () {
        $('body').removeClass('overflow-hidden');
        $('.preloader').fadeOut(1000);
    });

    /* 06: Contact Form
    ============================================== */
    $('.contact-form-wrapper').on('submit', 'form', function (e) {
        e.preventDefault();

        const $el = $(this);
        $.post($el.attr('action'), $el.serialize(), function (res) {
            const resonse = $.parseJSON(res);
            $el.parent('.contact-form-wrapper')
                .find('.form-response')
                .html(`<span>${resonse[1]}</span>`);
        });
    });

    /* 07: Offcanvas Margin
    ============================================== */
    const panelInner = document.querySelector(
        '#offcanvasBlog .offcanvas-panel-inner'
    );

    if (panelInner) {
        const scrollbarWidth = panelInner.offsetWidth - panelInner.clientWidth;
        if (scrollbarWidth > 0) {
            $(panelInner).css('margin-right', -scrollbarWidth);
        }
    }

    /* 08: Marquee
    ============================================== */
    const $marquee = $('[data-marquee]');
    const isRTL = $('html').attr('dir') === 'rtl';

    $marquee.marquee({
        direction: isRTL ? 'right' : 'left',
        delayBeforeStart: 0,
        duration: isRTL ? 8000 : 20000,
        pauseOnHover: true,
        startVisible: true,
    });

    /* 09: Update Current Date
    ============================================== */
    const today = new Date().toLocaleString('en-us', {
        month: 'long',
        year: 'numeric',
        day: 'numeric',
    });

    const currentYear = new Date().getFullYear();

    $('.date-now').text(today);
    $('.current--year').text(currentYear);

    /* 10: Ajax Load
    ============================================== */
    const ajaxTab = $('[data-ajax="tab"]');

    ajaxTab.on('click', '[data-ajax-action]', function (e) {

        const that = $(this);
        const content = $(`#${that.data('ajaxAction')}`);

        const preloader = $('.post--items').find('.preloader');
        preloader.css('display', 'flex');

        setTimeout(() => {
            preloader.fadeOut();
        }, 500);

        e.preventDefault();

        if (that.parent('li').length) {
            that.parent('li')
                .addClass('active')
                .siblings()
                .removeClass('active');
        }

        content.removeClass('d-none')
            .siblings()
            .addClass('d-none')
    });

    /* 11: Back to Top
    ============================================== */
    const backTop = $('.back-to-top');
    $(window).on('scroll', function () {
        if ($(window).scrollTop() > 400) {
            backTop.addClass('show');
        } else {
            backTop.removeClass('show');
        }
    });

    backTop.on('click', function () {
        return $('html, body').animate({ scrollTop: 0 }, 700);
    });

    /* 12: Swiper Slider
    ============================================== */
    const videoSlider = new Swiper('.video-slider', {
        mode: 'horizontal',
        loop: true,
        speed: 950,
        effect: 'coverflow',
        grabCursor: false,
        allowTouchMove: false,
        slidesPerView: 'auto',
        centeredSlides: true,
        spaceBetween: 10,
        pagination: {
            el: '.custom-pagination',
            clickable: true,
        },
        coverflowEffect: {
            rotate: 0,
            stretch: 0,
            depth: 0,
            modifier: 0,
            slideShadows: false,
        },
        breakpoints: {
            992: {
                effect: 'coverflow',
                spaceBetween: 0,
                coverflowEffect: {
                    rotate: 0,
                    stretch: 758,
                    depth: 120,
                    modifier: 1,
                    slideShadows: false,
                },
            },
            1200: {
                effect: 'coverflow',
                spaceBetween: 0,
                coverflowEffect: {
                    rotate: 0,
                    stretch: 844.5,
                    depth: 120,
                    modifier: 1,
                    slideShadows: false,
                },
            },
        },
    });

    const geoSlider = new Swiper('.geo-slider', {
        navigation: {
            nextEl: '.slider-button-next',
            prevEl: '.slider-button-prev',
        },
        pagination: {
            el: '.slider-pagination',
            clickable: true,
        },
    });

    const postSlider = new Swiper('.slider-post', {
        slidesPerView: 1,
        spaceBetween: 7,
        loop: true,
        pagination: {
            el: '.custom-pagination',
            clickable: true,
        },
        breakpoints: {
            992: {
                slidesPerView: 3,
            },
            767: {
                slidesPerView: 2,
            },
        },
    });

    const postGallerySlider = new Swiper('.post-gallery-slider', {
        slidesPerView: 1,
        spaceBetween: 0,
        loop: true,
        autoplay: {
            delay: 3500,
            disableOnInteraction: false,
        },
    });



    var home3Slider = new Swiper('.home3-slider', {
        slidesPerView: 'auto',
        centeredSlides: true,
        spaceBetween: 30,
        speed: 1000,
        loop: true,
        loopFillGroupWithBlank: true,
        autoplay: {
            delay: 3500,
            disableOnInteraction: false,
        },
        breakpoints: {
            900: {
                slidesPerView: 'auto',
            },
            575: {
                slidesPerView: 2,
            },
            0: {
                slidesPerView: 1,
            },
        },
    });

    var galleryThumbs = new Swiper('.gallery-thumbs', {
        spaceBetween: 12,
        slidesPerView: 4,
        loop: true,
        freeMode: true,
        loopedSlides: 5, //looped slides should be the same
        watchSlidesVisibility: true,
        watchSlidesProgress: true,
        breakpoints: {
            1199: {
                direction: 'vertical',
                centeredSlides: true,
            },
            0: {
                direction: 'horizontal',
                centeredSlides: true,
            }
        },
    });
    var galleryTop = new Swiper('.gallery-top', {
        spaceBetween: 12,
        loop: true,
        loopedSlides: 5, //looped slides should be the same
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        thumbs: {
            swiper: galleryThumbs,
        },
    });

    window.addEventListener(
        'load',
        () => {
            const gamingSlider = new Swiper('.gaming-slider', {
                slidesPerView: 'auto',
                centeredSlides: true,
                loop: true,
                autoplay: true,
                effect: 'coverflow',
                coverflowEffect: {
                    rotate: 0,
                    stretch: 700,
                    depth: 120,
                    modifier: 1,
                    slideShadows: false,
                },
                on: {
                    init() {
                        setTimeout(() => {
                            window.dispatchEvent(new Event('resize'));
                        }, 200);
                    },
                },
            });
        },
        false
    );
    /* Bottom Down */
    function bottomDown50() {
        const bottomDown = $('.bottom-down-50');
        $.each(bottomDown, function (i, c) {
            const that = $(c);
            const height = that.outerHeight();

            that.css({
                'margin-bottom': `-${height / 2}px`,
                position: 'relative',
                'z-index': '1000',
            });
        });
    }

    bottomDown50();

    /* 13: Support for SVG
    ============================================== */
    window.addEventListener(
        'load',
        () => {
            $('img.svg').each(function () {
                const $img = jQuery(this);
                const imgID = $img.attr('id');
                const imgClass = $img.attr('class');
                const imgURL = $img.attr('src');
                jQuery.get(
                    imgURL,
                    function (data) {
                        let $svg = jQuery(data).find('svg');
                        if (typeof imgID !== 'undefined') {
                            $svg = $svg.attr('id', imgID);
                        }
                        if (typeof imgClass !== 'undefined') {
                            $svg = $svg.attr(
                                'class',
                                `${imgClass} replaced-svg`
                            );
                        }

                        $svg = $svg.removeAttr('xmlns:a');

                        if (
                            !$svg.attr('viewBox') &&
                            $svg.attr('height') &&
                            $svg.attr('width')
                        ) {
                            $svg.attr(
                                'viewBox',
                                `0 0 ${$svg.attr('height')} ${$svg.attr(
                                    'width'
                                )}`
                            );
                        }

                        $img.replaceWith($svg);
                    },
                    'xml'
                );
            });
        },
        false
    );

    /* 14: Dropdown
    ============================================== */
    $('.dropdown').each(function () {
        $('.dropdown-button').on('click', function () {
            $(this).siblings('.dropdown-list').slideToggle();
            $(this).toggleClass('open');
        });
    });

    /* 15: Progress
    ============================================== */
    $('.progress').each(function () {
        let size = $(this).data('size');
        $(this).css("width", size + "%");
        $(this).parents(".review-item").find(".percent").html(size);
    });

    /* 16: Magnific Popup
    ============================================== */
    $(".video-btn").magnificPopup({ type: "video" });
    $(".gallery-link").magnificPopup({
        gallery: {
            enabled: true
        },
        type: "image"
    });

    /* 17: Google map 
    ====================================*/
    let style = [
        {
            "featureType": "administrative.country",
            "elementType": "geometry",
            "stylers": [
                {
                    "visibility": "simplified"
                },
                {
                    "hue": "#ff0000"
                }
            ]
        }
    ]

    var $map = $('[data-trigger="map"]'),
        $mapOps;

    if ($map.length) {
        // Map Options
        $mapOps = $map.data('map-options');

        // Map Initialization
        window.initMap = function () {
            $map.css('min-height', '350px');
            $map.each(function () {
                var $t = $(this), map, lat, lng, zoom;

                $mapOps = $t.data('map-options');
                lat = parseFloat($mapOps.latitude, 10);
                lng = parseFloat($mapOps.longitude, 10);
                zoom = parseFloat($mapOps.zoom, 10);

                map = new google.maps.Map($t[0], {
                    center: { lat: lat, lng: lng },
                    zoom: zoom,
                    scrollwheel: false,
                    disableDefaultUI: true,
                    zoomControl: true,
                    styles: style,
                });

                map = new google.maps.Marker({
                    position: { lat: lat, lng: lng },
                    map: map,
                    animation: google.maps.Animation.DROP,
                    draggable: false,
                    // icon: 'assets/img/map-marker.png'
                });

            });
        };
        initMap();
    };

    /* 19: Countdown Timer
    ====================================*/
    if ($('#countdown').length) {
        $('#countdown').countdown({
            date: '08/16/2022 23:59:59'
        });
    }


    /* 20: Slider Range
    ====================================*/
    if ($("#slider-range").length) {
        $("#slider-range").slider({
            range: true,
            min: 1,
            max: 14,
            values: [1, 14],
            slide: function (event, ui) {
                $('.min-amount').html("$" + ui.values[0] + ".000");
                $('.max-amount').html("$" + ui.values[1] + ".000");
            }
        });
    }

    /* 21: Elevate Zoom Active
    ====================================*/
    if ($('#elevate-zoom').length) {
        //initiate the plugin and pass the id of the div containing gallery images
        $("#img_01").elevateZoom({
            gallery: 'gal1',
            cursor: 'pointer',
            galleryActiveClass: 'active',
            imageCrossfade: true,
            loadingIcon: 'http://www.elevateweb.co.uk/spinner.gif',
            zoomType: 'inner',
            cursor: 'crosshair'
        });

        //pass the images to Fancybox
        $("#img_01").bind("click", function (e) {
            var ez = $('#img_01').data('elevateZoom');
            $.fancybox(ez.getGalleryList());
            return false;
        });
    }


    /* 22: Increase/Decrease Product Quantity
    ====================================*/
    /* 15.1: Increase */
    $('.plus').on('click', function () {
        var $qty = $(this).parent().find('input');
        var currentVal = parseInt($qty.val());
        if (!isNaN(currentVal)) {
            $qty.val(currentVal + 1);
        }
    });

    // /* 15.2: Decrease */
    $('.minus').on('click', function () {
        var $qty = $(this).parent().find('input');
        var currentVal = parseInt($qty.val());
        if (!isNaN(currentVal) && currentVal > 1) {
            $qty.val(currentVal - 1);
        }
    });

    /* 23: Tab
    ====================================*/
    var tabSelect = $('[data-tab-select]');
    var tab = $('[data-tab]');
    tabSelect.each(function () {
        var tabText = $(this).data('tab-select');
        $(this).on('click', function () {
            $(this).addClass('active').siblings().removeClass('active');
            tab.each(function () {
                if (tabText === $(this).data('tab')) {
                    $(this).fadeIn(500).siblings().hide(); // for click
                    // $(this).fadeIn(500).siblings().stop().hide(); // active if hover
                    $(this).addClass('active').siblings().removeClass('active');
                }
            });
        });
        if ($(this).hasClass('active')) {
            tab.each(function () {
                if (tabText === $(this).data('tab')) {
                    $(this).addClass('active');
                }
                if ($(this).hasClass('active')) {
                    $(this).show().siblings().hide();
                }
            });
        }
    });


})(jQuery);
