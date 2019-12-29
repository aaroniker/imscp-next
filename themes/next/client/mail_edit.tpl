
<script>
    $(function () {
        function fixQuotaField() {
            // Make sure that hidden quota field will pass browser validations on submit
            var $quotaInput = $("#quota");
            var quotaInputValue = parseInt($quotaInput.val());
            var quotaInputMinValue = parseInt($quotaInput.attr('min'));
            var quotaInputMaxValue = parseInt($quotaInput.attr('max'));

            if (isNaN(quotaInputValue)
                || quotaInputValue < quotaInputMinValue
                || quotaInputValue > quotaInputMaxValue
            ) {
                $quotaInput.val(quotaInputMinValue);
            }
        }

        if(imscp_i18n.core.mail_add_forward_only) {
            $("#forward").prop('checked', true).closest('tr').hide();
            $("#tr_forward_list").show();
            $("#tr_password, #tr_password_rep, #tr_quota").hide();
            fixQuotaField();
        } else {
            $("input[name='account_type']").on('change', function () {
                    fixQuotaField();

                    if ($(this).val() === '1') { // Normal email account
                        $("#tr_password, #tr_password_rep, #tr_quota").show();
                        $("#tr_forward_list").hide();
                        return;
                    }

                    if ($(this).val() === '2') { // Forward email account
                        $("#tr_forward_list").show();
                        $("#tr_password, #tr_password_rep, #tr_quota").hide();
                        return;
                    }

                    // Normal + Forward email account
                    $("#tr_password, #tr_password_rep, #tr_quota").show();
                    $("#tr_forward_list").show();
                }
            ).parent().find(':checked').trigger('change'); // Initialize form
        }
    });
</script>

<form name="client_mail_edit" action="mail_edit.php?id={MAIL_ID}" method="post" autocomplete="off">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_MAIl_ACCOUNT_DATA}</h3>
        </header>
        <section>
            <div class="form-element">
                <label>{TR_MAIL_ACCOUNT_TYPE}</label>
                <div>
                    <label class="radio inline">
                        <input type="radio" name="account_type" id="normal" value="1"{NORMAL_CHECKED}>
                        <span>{TR_NORMAL_MAIL}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="account_type" id="forward" value="2"{FORWARD_CHECKED}>
                        <span>{TR_FORWARD_MAIL}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="account_type" id="normal_forward" value="3"{NORMAL_FORWARD_CHECKED}>
                        <span>{TR_FORWARD_NORMAL_MAIL}</span>
                    </label>
                </div>
            </div>
            <div class="form-element">
                <label for="username">{TR_USERNAME}</label>
                <input class="form-field" type="text" name="username" id="username" value="{USERNAME}" disabled>
            </div>
            <div class="form-element">
                <label for="domain_name">{TR_DOMAIN_NAME}</label>
                <div class="form-select">
                    <select name="domain_name" id="domain_name" disabled>
                        <option value="{DOMAIN_NAME}"{DOMAIN_NAME_SELECTED}>{DOMAIN_NAME_UNICODE}</option>
                    </select>
                </div>
            </div>
            <div id="tr_password" class="form-element">
                <label for="password">{TR_PASSWORD}</label>
                <input class="form-field pwd_generator" type="password" name="password" value="" autocomplete="new-password" id="password">
            </div>
            <div id="tr_password_rep" class="form-element">
                <label for="cpassword">{TR_PASSWORD_REPEAT}</label>
                <input class="form-field" type="password" name="password_rep" value="" autocomplete="new-password" id="cpassword">
            </div>
            <div id="tr_quota" class="form-element">
                <label for="quota">{TR_QUOTA}</label>
                <input class="form-field" name="quota" id="quota" type="number" min="{MIN_QUOTA}" max="{MAX_QUOTA}" value="{QUOTA}">
            </div>
            <div id="tr_forward_list" class="form-element">
                <label for="forward_list">
                    {TR_FORWARD_TO}
                    <span class="tooltip-circle" data-tooltip="{TR_FWD_HELP}">
                        <i data-eva="question-mark-circle"></i>
                    </span>
                </label>
                <textarea class="form-field" name="forward_list" id="forward_list">{FORWARD_LIST}</textarea>
            </div>
            <div class="form-element">
                <div class="action">
                    <button name="Submit" type="submit" class="btn">
                        {TR_UPDATE}
                    </button>
                    <a href="mail_accounts.php" class="btn muted">{TR_CANCEL}</a>
                </div>
            </div>
        </section>
    </div>
</form>
