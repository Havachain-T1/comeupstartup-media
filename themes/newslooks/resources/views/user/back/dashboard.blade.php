@extends('core::base.layouts.master')

@section('title')
    {{ front_translate('User Dashboard') }}
@endsection

@section('custom_css')
    @include('core::base.includes.data_table.css')
@endsection

@section('main_content')
    <!-- Main Content -->
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-30">
                <div class="card-header px-3 py-4">
                    <div class="d-sm-flex justify-content-between align-items-center">
                        <h3 class="font-24">
                            {{ front_translate('Reading List') }}
                        </h3>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="border-top2" id="reading-list-table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>{{ front_translate('Image') }}</th>
                                    <th>{{ front_translate('Blog') }}</th>
                                    <th>{{ front_translate('Action') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($readingLists as $blog)
                                    <tr>
                                        <td>
                                            {{ $loop->iteration }}
                                        </td>

                                        <td class="w-20">
                                            @php
                                                $small_variation = getImageVariation($blog->image, 'small');
                                            @endphp
                                            <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}">
                                                <img src="{{ $small_variation }}" alt="" class="img-70 h-auto">
                                            </a>
                                        </td>

                                        <td class="w-75">
                                            <a href="{{ route('theme.newslooks.blog.details', $blog->permalink) }}"
                                                target="_blank"
                                                class="text-primary d-block mb-1">{{ mb_substr($blog->translation('name', getLocale()), 0, 50, 'UTF-8') }}</a>
                                        </td>

                                        <td>
                                            <a href="javascript:;void(0)" class="btn sm btn-danger p-2 remove-list"
                                                data-id="{{ $blog->id }}">x</a>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Main Content -->

    <!--Blog Delete Modal-->
    <div id="delete-modal" class="delete-modal modal fade show" aria-modal="true">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title h6">{{ front_translate('Remove Confirmation') }}</h4>
                </div>
                <div class="modal-body text-center">
                    <p class="mt-1">{{ front_translate('Are you sure to remove this') }}?</p>
                    <form method="POST" action="{{ route('theme.newslooks.user.remove.readingList') }}" id="delete-form">
                        @csrf
                        @method('DELETE')
                        <input type="hidden" name="blog_id" id="blog_id">
                        <button type="button" class="btn long mt-2  btn-danger"
                            data-dismiss="modal">{{ front_translate('Cancel') }}</button>
                        <button type="submit" class="btn long mt-2">{{ front_translate('Remove') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--Blog Delete Modal End-->
@endsection

@section('custom_scripts')
    @include('core::base.includes.data_table.script')

    <script>
        (function($) {
            'use strict'

            $("#reading-list-table").DataTable();

            $(document).on('click', '.remove-list', function(){
                let id = $(this).data('id');
                $('#delete-form').find('#blog_id').val(id);
                $('#delete-modal').modal('show');
            });

        })(jQuery);
    </script>
@endsection
