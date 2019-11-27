
<script>
    $(function () {
        var $datePicker = $('#datepicker');
        var $neverExpire = $('#never_expire');

        $datePicker.datepicker().on('change', function () {
            if ($(this).val() != '') {
                $neverExpire.prop('disabled', true);
                return;
            }
            $(this).prop('disabled', true);
            $neverExpire.prop('checked', true).prop("disabled", false);
        });

        $neverExpire.on('change', function () {
            if ($(this).is(':checked')) {
                $datePicker.prop('disabled', true);
                return;
            }
            $datePicker.prop('disabled', false);
        });

        $('input[name="url_forwarding"]').on('change', function() {
            $('#tr_url_forwarding_data, #tr_type_forwarding_data').toggle(!$('#url_forwarding_no').is(':checked'));
        }).trigger('change');

        $('input[name="forward_type"]').on('change', function() {
            $('#proxy-checkbox').toggle($('#forward_type_proxy').is(':checked'));
        }).trigger('change');
    });
</script>

<form name="reseller_add_users_first_frm" method="post" action="user_add1.php">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_CORE_DATA}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="dmn_name">{TR_DOMAIN_NAME}</label>
                <div class="form-group">
                    <span>www.</span>
                    <input class="form-field" type="text" name="dmn_name" id="dmn_name" value="{DOMAIN_NAME_VALUE}">
                </div>
            </div>
            <div class="form-element">
                <label>
                    {TR_URL_FORWARDING}
                    <span class="tooltip-circle" data-tooltip="{TR_URL_FORWARDING_TOOLTIP}">
                        <i data-eva="question-mark-circle"></i>
                    </span>
                </label>
                <div>
                    <label class="radio inline">
                        <input type="radio" name="url_forwarding" id="url_forwarding_yes" value="yes"{FORWARD_URL_YES}>
                        <span>{TR_YES}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="url_forwarding" id="url_forwarding_no" value="no"{FORWARD_URL_NO}>
                        <span>{TR_NO}</span>
                    </label>
                </div>
            </div>
            <div id="tr_url_forwarding_data" class="form-element">
                <label>{TR_FORWARD_TO_URL}</label>
                <div class="form-group">
                    <div class="form-select">
                        <select name="forward_url_scheme" id="forward_url_scheme">
                            <option value="http://"{HTTP_YES}>{TR_HTTP}</option>
                            <option value="https://"{HTTPS_YES}>{TR_HTTPS}</option>
                        </select>
                    </div>
                    <input class="form-field" name="forward_url" type="text" id="forward_url" value="{FORWARD_URL}">
                </div>
            </div>
            <div id="tr_type_forwarding_data" class="form-element">
                <label>{TR_FORWARD_TYPE}</label>
                <div>
                    <label class="radio inline">
                        <input type="radio" name="forward_type" id="forward_type_301"{FORWARD_TYPE_301} value="301">
                        <span>{TR_301}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="forward_type" id="forward_type_302"{FORWARD_TYPE_302} value="302">
                        <span>{TR_302}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="forward_type" id="forward_type_303"{FORWARD_TYPE_303} value="303">
                        <span>{TR_303}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="forward_type" id="forward_type_307"{FORWARD_TYPE_307} value="307">
                        <span>{TR_307}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="forward_type" id="forward_type_proxy"{FORWARD_TYPE_PROXY} value="proxy">
                        <span>{TR_PROXY}</span>
                    </label>
                    <label id="proxy-checkbox" class="checkbox inline">
                        <input type="checkbox" name="forward_host" id="forward_host"{FORWARD_HOST}>
                        <span>{TR_PROXY_PRESERVE_HOST}</span>
                    </label>
                </div>
            </div>
            <div class="form-element">
                <label>{TR_DOMAIN_EXPIRE}</label>
                <div class="form-group">
                    <input class="form-field" type="text" name="datepicker" id="datepicker" value="{DATEPICKER_VALUE}"{DATEPICKER_DISABLED}>
                    <div class="toggle">
                        <label class="checkbox">
                            <input type="checkbox" name="never_expire" id="never_expire" value="0"{NEVER_EXPIRE_CHECKED}>
                            <span>{TR_EXPIRE_CHECKBOX}</span>
                        </label>
                    </div>
                </div>
            </div>
            <!-- BDP: hosting_plan_entries_block -->
            <div class="form-element">
                <label for="dmn_tpl">{TR_CHOOSE_HOSTING_PLAN}</label>
                <div class="form-select">
                    <select id="dmn_tpl" name="dmn_tpl">
                        <!-- BDP: hosting_plan_entry_block -->
                        <option value="{HP_ID}"{HP_SELECTED}>{HP_NAME}</option>
                        <!-- EDP: hosting_plan_entry_block -->
                    </select>
                </div>
            </div>
            <!-- BDP: customize_hosting_plan_block -->
            <div class="form-element">
                <label>{TR_PERSONALIZE_TEMPLATE}</label>
                <div>
                    <label class="radio inline">
                        <input type="radio" name="chtpl" id="chtpl_yes"{CHTPL1_VAL} value="_yes_">
                        <span>{TR_YES}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="chtpl" id="chtpl_no"{CHTPL2_VAL} value="_no_">
                        <span>{TR_NO}</span>
                    </label>
                </div>
            </div>
            <!-- EDP: customize_hosting_plan_block -->
            <!-- EDP: hosting_plan_entries_block -->
            <div class="form-element">
                <div class="action">
                    <button name="Submit" type="submit" class="btn">
                        {TR_NEXT_STEP}
                    </button>
                </div>
            </div>
        </section>
    </div>
</form>
