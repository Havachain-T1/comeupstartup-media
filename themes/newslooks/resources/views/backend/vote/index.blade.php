@extends('core::base.layouts.master')

@section('title')
    {{ translate('Voting') }}
@endsection

@section('custom_css')
@endsection

@section('main_content')
    <!-- Main Content -->
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-30">
                <div class="card-header">
                    <div class="d-flex justify-content-between align-items-center">
                        <h3 class="font-24">{{ translate('Votes') }}</h3>
                        <div class="d-flex flex-wrap">
                            <a href="{{ route('theme.newslooks.vote.create') }}"
                                class="btn long">{{ translate('Add Vote') }}</a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="hoverable text-nowrap border-top2">
                            <thead>
                                <tr>
                                    <th>{{ translate('Image') }}</th>
                                    <th>{{ translate('Title') }}</th>
                                    <th>{{ translate('Actions') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($votes as $vote)
                                    <tr>
                                        <td>
                                            <img src="{{ getFilePath($vote->image) }}" alt="" class="img-45">
                                        </td>

                                        <td>
                                            {{ $vote->translation(getLocale()) }}
                                        </td>

                                        <td>
                                            <div class="dropdown-button">
                                                <a href="#" class="d-flex align-items-center" data-toggle="dropdown">
                                                    <div class="menu-icon style--two mr-0">
                                                        <span></span>
                                                        <span></span>
                                                        <span></span>
                                                    </div>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right">
                                                    <a
                                                        href="{{ route('theme.newslooks.vote.edit', ['vote' => $vote->id, 'lang' => getDefaultLang()]) }}">{{ translate('Edit') }}</a>
                                                    <a href="#"
                                                        data-href="{{ route('theme.newslooks.vote.delete', ['vote' => $vote->id]) }}" class="delete-btn">{{ translate('Delete') }}</a>
                                                </div>
                                            </div>
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

    <!-- Vote Delete Modal-->
    <div id="delete-modal" class="delete-modal modal fade show" aria-modal="true">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title h6">{{ translate('Delete Confirmation') }}</h4>
                </div>
                <div class="modal-body text-center">
                    <p class="mt-1">{{ translate('Are you sure to delete this') }}?</p>
                    <form method="POST" action="" id="delete-form">
                        @csrf
                        @method('DELETE')
                        <button type="button" class="btn long mt-2  btn-danger"
                            data-dismiss="modal">{{ translate('Cancel') }}</button>
                        <button type="submit" class="btn long mt-2">{{ translate('Delete') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Vote Delete Modal End-->
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

            $('.delete-btn').on('click', function(){
                let url = $(this).data('href');
                $('#delete-form').attr('action', url);
                $('#delete-modal').modal('show');
            })

        })(jQuery);
    </script>
@endsection
