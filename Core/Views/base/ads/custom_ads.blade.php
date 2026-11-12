@extends('core::base.layouts.master')

@section('title')
    {{ translate('Ads') }}
@endsection

@section('custom_css')
    <!-- ======= Data-Tables Styles ======= -->
    @include('core::base.includes.data_table.css')
    <!-- ======= Data-Tables Styles Endd ======= -->
@endsection

@section('main_content')
    <!-- Main Content -->
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-30">
                <div class="card-header d-flex bg-white justify-content-between align-items-center">
                    <h3 class="font-24">{{ translate('All Ads') }}</h3>
                    @can('Create Ad')
                        <a href="{{ route('core.ads.add') }}" class="btn long">{{ translate('Add New Ad') }}</a>
                    @endcan
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="hoverable text-nowrap" id="page_table">
                            <thead>
                                <tr>
                                    <th>{{ translate('Title') }}</th>
                                    <th>{{ translate('Type') }}</th>
                                    <th>{{ translate('Size') }}</th>
                                    <th>{{ translate('Start Date') }}</th>
                                    <th>{{ translate('End Date') }}</th>
                                    <th>{{ translate('Status') }}</th>
                                    <th>{{ translate('Actions') }}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($custom_ads as $ad)
                                    <tr>
                                        <td>{{ $ad->title }}</td>
                                        <td>{{ $ad->type }}</td>
                                        <td>{{ $ad->size }}</td>
                                        <td>{{ $ad->start_date }}</td>
                                        <td>{{ $ad->end_date }}</td>
                                        <td>
                                            @php($state = $ad->displayState())
                                            @if ($state === 'live')
                                                <p class="badge badge-success">{{ translate('Live') }}</p>
                                            @elseif ($state === 'scheduled')
                                                <p class="badge badge-info">{{ translate('Scheduled') }}</p>
                                            @elseif ($state === 'expired')
                                                <p class="badge badge-secondary">{{ translate('Expired') }}</p>
                                            @elseif ($state === 'missing_dates')
                                                <p class="badge badge-warning" title="{{ translate('Add dates or enable Run without dates to display this ad') }}">{{ translate('Hidden: missing dates') }}</p>
                                            @else
                                                <p class="badge badge-danger">{{ translate('Inactive') }}</p>
                                            @endif
                                        </td>
                                        @canany(['Edit Ad', 'Delete Ad'])
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
                                                        @can('Edit Ad')
                                                            <a href="{{ route('core.ads.edit', ['id' => $ad->id]) }}">
                                                                {{ translate('Edit') }}
                                                            </a>
                                                        @endcan
                                                        @can('Delete Ad')
                                                            <a href="#" onclick="deleteConfirmation('{{ $ad->id }}')">
                                                                {{ translate('Delete') }}
                                                            </a>
                                                        @endcan
                                                    </div>
                                                </div>
                                            </td>
                                        @endcanany
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="7">
                                            <p class="alert alert-danger text-center">{{ translate('No Ads Found') }}</p>
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Main Content -->

    <!-- page Bulk Delete Modal-->
    <div id="pagebulkdelete-modal" class="pagebulkdelete-modal modal fade show" aria-modal="true">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title h6">{{ translate('Delete Confirmation') }}</h4>
                </div>
                <div class="modal-body text-center">
                    <p class="mt-1">{{ translate('Are you sure to delete this') }}?</p>
                    <button type="button" class="btn long mt-2  btn-danger"
                        data-dismiss="modal">{{ translate('cancel') }}</button>
                    <button class="btn long mt-2" onclick="bulkAction()">{{ translate('Delete') }}</button>
                </div>
            </div>
        </div>
    </div>
    <!--page Bulk Delete Modal End-->

    <!--Page Delete Modal-->
    <div id="delete-modal" class="delete-modal modal fade show" aria-modal="true">
        <div class="modal-dialog modal-sm modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title h6">{{ translate('Delete Confirmation') }}</h4>
                </div>
                <div class="modal-body text-center">
                    <p class="mt-1">{{ translate('Are you sure to delete this') }}?</p>
                    <form method="POST" action="{{ route('core.ads.delete') }}">
                        @csrf
                        <input type="hidden" id="delete-id" name="id">
                        <button type="button" class="btn long mt-2  btn-danger"
                            data-dismiss="modal">{{ translate('cancel') }}</button>
                        <button type="submit" class="btn long mt-2">{{ translate('Delete') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--Page Delete Modal End-->
@endsection

@section('custom_scripts')
    <script  type="application/javascript">
        /**
        * show page delete confirmation modal
        */
        function deleteConfirmation(id)
        {
            "use strict";
            $("#delete-id").val(id);
            $('#delete-modal').modal('show');
        }

    </script>
@endsection
