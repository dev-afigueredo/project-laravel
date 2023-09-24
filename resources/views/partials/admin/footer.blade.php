@stack('footer_start')
    <footer class="footer">
        <div class="row">
            <div class="col-xs-12 col-sm-6">
                <div class="text-sm float-left text-muted footer-texts">
                    <img src="{{ asset('public/img/developer.png') }}" width="20%" alt="AFIGUEREDO DEVELOPER LTDA"/>
                    <a href="javascript:void(0)" class="text-muted">{{ trans('footer.software') }}</a>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6">
                <div class="text-sm float-right text-muted footer-texts">
                    {{ trans('footer.version') }} {{ config('app.version') }}
                </div>
            </div>
        </div>
    </footer>
@stack('footer_end')
