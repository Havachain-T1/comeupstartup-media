@extends('core::base.layouts.master')

@section('title')
    {{ translate('Manage Members') }}
@endsection

@section('custom_css')
@endsection

@section('main_content')
    <!-- Main Content -->
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-30">
                <div class="card-header border-0">
                    <div class="d-flex justify-content-between align-items-center">
                        <h3 class="font-24">{{ translate('Manage Members') }}</h3>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="hoverable text-nowrap border-top2">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>{{ translate('Image') }}</th>
                                    <th>{{ translate('Name') }}</th>
                                    <th>{{ translate('Joined At') }}</th>
                                    <th>{{ translate('Status') }}</th>
                                    <th>{{ translate('Actions') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($users as $user)
                                    <tr>
                                        <td>
                                            {{ $loop->iteration }}
                                        </td>

                                        <td>
                                            <img src="{{ userImage($user) }}" alt="" class="img-45">
                                        </td>

                                        <td>
                                            {{ $user->name }}
                                        </td>

                                        <td>
                                            {{ getFormatedDateTime($user->created_at, 'd M Y h:m A') }}
                                        </td>

                                        <td>
                                            <label class="switch glow primary medium">
                                                <input type="checkbox" class="change_status"
                                                    {{ $user->status == '1' ? 'checked' : '' }} name="change_status"
                                                    data-user="{{ $user->id }}">
                                                <span class="control"></span>
                                            </label>
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
                                                    <a href="javascript:;void(0)" class="delete-btn"
                                                        data-id="{{ $user->id }}">
                                                        {{ translate('Delete') }}</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        {{-- pagination --}}
                        <div class="row ml-2 mt-2 justify-content-between">
                            {{ $users->onEachSide(1)->appends(request()->input())->links('pagination::bootstrap-5-custom') }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Main Content -->

    <!-- User Delete Modal-->
    <div id="delete-modal" class="delete-modal modal fade show" aria-modal="true">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title h6">{{ translate('Delete Confirmation') }}</h4>
                </div>
                <div class="modal-body text-center">
                    <p class="mt-1">{{ translate('Are you sure to delete this') }}?</p>
                    <form method="POST" action="{{ route('theme.newslooks.users.delete') }}" id="delete-form">
                        @csrf
                        @method('DELETE')
                        <input type="hidden" name="user_id" id="user_id">
                        <button type="button" class="btn long mt-2  btn-danger"
                            data-dismiss="modal">{{ translate('Cancel') }}</button>
                        <button type="submit" class="btn long mt-2">{{ translate('Delete') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- User Delete Modal End-->
@endsection

@section('custom_scripts')
    <script>
        (function($) {
            'use strict'

            /**
             * Change status 
             * */
            $('.change_status').on('click', function(e) {
                e.preventDefault();
                let $this = $(this);
                let id = $this.data('user');

                $.ajax({
                    type: "POST",
                    url: "{{ route('theme.newslooks.users.status') }}",
                    data: {
                        _token: '{{ csrf_token() }}',
                        user_id: id
                    },
                    success: function (response) {
                        switch (response.result) {
                            case 'on':
                                $this.prop('checked', true);
                                break;
                            case 'off':
                                $this.prop('checked', false);
                                break;
                        }
                        toastr.success(response.message, "Success!");
                    }, 
                    error: function (response) {
                        toastr.error(response.responseJSON.message, "Error!");
                    }
                });
            });

            $('.delete-btn').on('click', function() {
                let id = $(this).data('id');
                $('#user_id').val(id);
                $('#delete-modal').modal('show');
            });

        })(jQuery);
    </script>
@endsection
