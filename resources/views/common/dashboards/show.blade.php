@extends('layouts.admin')

@section('title', env("APP_NAME"))

@section('content')
    <div id="slider" class="carousel slide text-center" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div>
                    <img class="d-block w-100" height="400" width="400" src="{{ asset('public/img/auth/diagnostic-dicom-viewer.svg') }}"/>
                </div>

                <h1 class="text-3xl text-black-400 font-bold">
                    {{ trans('auth.information.diagnostic-dicom-viewer') }}
                </h1>
            </div>
            <div class="carousel-item">
                <div>
                    <img class="d-block w-100" height="400" width="400" src="{{ asset('public/img/auth/multi-users.svg') }}"/>
                </div>

                <h1 class="text-3xl text-black-400 font-bold">
                    {{ trans('auth.information.multi-users') }}
                </h1>
            </div>
            <div class="carousel-item">
                <div >
                    <img class="d-block w-100" height="400" width="400" src="{{ asset('public/img/auth/clinical-documents-viewer.svg') }}"/>
                </div>

                <h1 class="text-3xl text-black-400 font-bold">
                    {{ trans('auth.information.clinical-documents-viewer') }}
                </h1>
            </div>
        </div>
        <a class="carousel-control-prev text-black" href="#slider" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next  text-black" href="#slider" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only text-black">Next</span>
        </a>
    </div>
@endsection

@push('scripts_start')
    <script src="{{ asset('public/js/common/dashboards.js?v=' . version('short')) }}"></script>
@endpush
