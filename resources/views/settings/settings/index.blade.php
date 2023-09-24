@extends('layouts.admin')

@section('title', trans_choice('general.settings',2))

@section('content')
    <div class="card shadow">
        <div class="card-body">
            <div class="row">
                @can('read-settings-company')
                    <div class="col-md-4">
                        <a href="{{ route('settings.company.edit') }}">
                            <button type="button" class="btn-icon-clipboard p-2">
                                <div class="row mx-0">
                                    <div class="col-auto">
                                        <div class="badge badge-secondary settings-icons">
                                            <i class="fa fa-building" ></i>
                                        </div>
                                    </div>
                                    <div class="col ml--2">
                                        <h4 class="mb-0">{{ trans_choice('general.companies', 1) }}</h4>
                                        <p class="text-sm text-muted mb-0">{{ trans('settings.company.description') }}</p>
                                    </div>
                                </div>
                            </button>
                        </a>
                    </div>
                @endcan

                @can('read-settings-localisation')
                    <div class="col-md-4">
                        <a href="{{ route('settings.localisation.edit') }}">
                            <button type="button" class="btn-icon-clipboard p-2">
                                <div class="row mx-0">
                                    <div class="col-auto">
                                        <div class="badge badge-secondary settings-icons">
                                            <i class="fas fa-map-marker-alt"></i>
                                        </div>
                                    </div>
                                    <div class="col ml--2">
                                        <h4 class="mb-0">{{ trans_choice('general.localisations', 1) }}</h4>
                                        <p class="text-sm text-muted mb-0">{{ trans('settings.localisation.description') }}</p>
                                    </div>
                                </div>
                            </button>
                        </a>
                    </div>
                @endcan

                @can('read-settings-defaults')
                    <div class="col-md-4">
                        <a href="{{ route('settings.default.edit') }}">
                            <button type="button" class="btn-icon-clipboard p-2">
                                <div class="row mx-0">
                                    <div class="col-auto">
                                        <div class="badge badge-secondary settings-icons">
                                            <i class="fa fa-sliders-h"></i>
                                        </div>
                                    </div>
                                    <div class="col ml--2">
                                        <h4 class="mb-0">{{ trans_choice('general.defaults', 1) }}</h4>
                                        <p class="text-sm text-muted mb-0">{{ trans('settings.default.description') }}</p>
                                    </div>
                                </div>
                            </button>
                        </a>
                    </div>
                @endcan
            </div>
        </div>
    </div>
@endsection

@push('scripts_start')
    <script src="{{ asset('public/js/settings/settings.js?v=' . version('short')) }}"></script>
@endpush
