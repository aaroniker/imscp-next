
<script>
    $(function () {
        if (!$("#add_update").length) {
            <!-- BDP: ssl_certificate_disabled_fields -->
            $("#selfsigned").hide();
            $("input,textarea").prop("disabled", true).trigger("change");
            <!-- EDP: ssl_certificate_disabled_fields -->
        }

        $('#allow_hsts_on,#allow_hsts_off').on('change', function() {
            $('#tr_hsts_max_age_data, #tr_hsts_include_subdomains_data').toggle($("#allow_hsts_on").is(':checked'));
        }).trigger('change');

        $('#selfsigned_on, #selfsigned_off').on('change', function() {
            $('.input_fields').toggle(!$("#selfsigned_on").is(":checked"));
        }).trigger('change');
    });
</script>

<form name="ssl_cert_frm" method="post" action="cert_view.php?domain_id={DOMAIN_ID}&domain_type={DOMAIN_TYPE}" autocomplete="off">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_CERTIFICATE_DATA}</h3>
        </header>
        <section>
            <div class="form-element">
                <label>{TR_CERT_FOR}</label>
                <p class="static">{DOMAIN_NAME}</p>
            </div>
            <!-- BDP: ssl_certificate_status -->
            <div class="form-element">
                <label>{TR_STATUS}</label>
                <p class="static">{STATUS}</p>
            </div>
            <!-- EDP: ssl_certificate_status -->
            <!-- BDP: ssl_certificate_hsts -->
            <div class="form-element">
                <label>{TR_ALLOW_HSTS}</label>
                <div>
                    <label class="radio inline">
                        <input type="radio" name="allow_hsts" id="allow_hsts_on" value="on"{HSTS_CHECKED_ON}>
                        <span>{TR_YES}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="allow_hsts" id="allow_hsts_off" value="off"{HSTS_CHECKED_OFF}>
                        <span>{TR_NO}</span>
                    </label>
                </div>
            </div>
            <div class="form-element" id="tr_hsts_max_age_data">
                <label for="hsts_max_age">{TR_HSTS_MAX_AGE}</label>
                <div class="form-group">
                    <input class="form-field" name="hsts_max_age" id="hsts_max_age" type="text" value="{HSTS_MAX_AGE}">
                    <span>{TR_SEC}</span>
                </div>
            </div>
            <div class="form-element">
                <label>
                    {TR_HSTS_INCLUDE_SUBDOMAINS}
                    <span class="tooltip-circle" data-tooltip="{TR_HSTS_INCLUDE_SUBDOMAINS_TOOLTIP}">
                        <i data-eva="question-mark-circle"></i>
                    </span>
                </label>
                <div>
                    <label class="radio inline">
                        <input type="radio" name="hsts_include_subdomains" id="hsts_include_subdomains_on" value="on"{HSTS_INCLUDE_SUBDOMAIN_ON}>
                        <span>{TR_YES}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="hsts_include_subdomains" id="hsts_include_subdomains_off" value="off"{HSTS_INCLUDE_SUBDOMAIN_OFF}>
                        <span>{TR_NO}</span>
                    </label>
                </div>
            </div>
            <!-- EDP: ssl_certificate_hsts -->
            <!-- BDP: ssl_certificate_selfsigned -->
            <div class="form-element" id="selfsigned">
                <label>{TR_GENERATE_SELFSIGNED_CERTIFICAT}</label>
                <div>
                    <label class="radio inline">
                        <input type="radio" name="selfsigned" id="selfsigned_on" value="on">
                        <span>{TR_YES}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="selfsigned" id="selfsigned_off" value="off" checked>
                        <span>{TR_NO}</span>
                    </label>
                </div>
            </div>
            <!-- EDP: ssl_certificate_selfsigned -->
            <!-- BDP: ssl_certificate_pk_pwd -->
            <div class="form-element input_fields">
                <label for="passphrase">{TR_PASSWORD}</label>
                <input class="form-field" id="passphrase" type="password" name="passphrase" value="" autocomplete="new-password">
            </div>
            <!-- EDP: ssl_certificate_pk_pwd -->
            <!-- BDP: ssl_certificate_certchain -->
            <div class="form-element input_fields">
                <label for="private_key">{TR_PRIVATE_KEY}</label>
                <textarea class="form-field" name="private_key" id="private_key">{KEY_CERT}</textarea>
            </div>
            <div class="form-element input_fields">
                <label for="certificate">{TR_CERTIFICATE}</label>
                <textarea class="form-field" name="certificate" id="certificate">{CERTIFICATE}</textarea>
            </div>
            <div class="form-element input_fields">
                <label for="ca_bundle">{TR_CA_BUNDLE}</label>
                <textarea class="form-field" name="ca_bundle" id="ca_bundle">{CA_BUNDLE}</textarea>
            </div>
            <!-- EDP: ssl_certificate_certchain -->
            <div class="form-element">
                <div class="action">
                    <!-- BDP: ssl_certificate_actions -->
                    <!-- BDP: ssl_certificate_action_update -->
                    <button class="btn" name="add_update" id="add_update" type="submit">
                        {TR_ACTION}
                    </button>
                    <!-- EDP: ssl_certificate_action_update -->
                    <!-- BDP: ssl_certificate_action_delete -->
                    <button class="btn danger" name="delete" id="delete" type="submit">
                        {TR_DELETE}
                    </button>
                    <!-- EDP: ssl_certificate_action_delete -->
                    <input name="cert_id" type="hidden" value="{CERT_ID}">
                    <!-- EDP: ssl_certificate_actions -->
                    <a href="domains_manage.php" class="btn muted">{TR_CANCEL}</a>
                </div>
            </div>
        </section>
    </div>
</form>
