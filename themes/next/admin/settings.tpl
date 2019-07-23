<script>
    $(function() {

        $('#lostpassword, #passwd_strong, #bruteforce').change(function () {
            $(this).parents().nextAll(".display").toggle($(this).val() == '1');
        }).trigger('change');

        let boxes = $('.accordion .box');

        setActive(typeof(Storage) !== 'undefined' ? parseInt(sessionStorage.getItem('/admin/settings.php')) || 0 : 0);

        boxes.on('click', function(e) {
            let index = $(this).index();
            setActive(index);
        });

        function setActive(index) {
            if((typeof(Storage) !== 'undefined')) {
                sessionStorage.setItem('/admin/settings.php', parseInt(index));
            }
            if($(boxes[index]).find(' > div:last-child').is(':hidden')) {
                boxes.removeClass('expand active');
                boxes.find(' > div:last-child').slideUp(400);
                $(boxes[index]).addClass('expand');
                $(boxes[index]).find(' > div:last-child').slideDown(400, function() {
                    $(boxes[index]).addClass('active');
                });
            }
        }

    });
</script>
<form action="settings.php" method="post" name="frmsettings" id="frmsettings">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_TITLE}</h3>
        </header>
        <section class="accordion">
            <div>
                <div class="box">
                    <div>{TR_UPDATES}<span></span></div>
                    <div>
                        <div class="form-element">
                            <label for="checkforupdate">{TR_CHECK_FOR_UPDATES}</label>
                            <div class="form-select">
                                <select name="checkforupdate" id="checkforupdate">
                                    <option value="0"{CHECK_FOR_UPDATES_SELECTED_OFF}>{TR_DISABLED}</option>
                                    <option value="1"{CHECK_FOR_UPDATES_SELECTED_ON}>{TR_ENABLED}</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div>{TR_LOSTPASSWORD}<span></span></div>
                    <div>
                        <div class="form-element">
                            <label for="lostpassword">{TR_LOSTPASSWORD}</label>
                            <div class="form-select">
                                <select name="lostpassword" id="lostpassword">
                                    <option value="0"{LOSTPASSWORD_SELECTED_OFF}>{TR_DISABLED}</option>
                                    <option value="1"{LOSTPASSWORD_SELECTED_ON}>{TR_ENABLED}</option>
                                </select>
                            </div>
                        </div>
                        <div class="display form-element">
                            <label for="lostpassword_timeout">{TR_LOSTPASSWORD_TIMEOUT}</label>
                            <input type="number" class="form-field" name="lostpassword_timeout" id="lostpassword_timeout" min="1" max="1440" value="{LOSTPASSWORD_TIMEOUT_VALUE}">
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div>{TR_PASSWORD_SETTINGS}<span></span></div>
                    <div>
                        <div class="form-element">
                            <label for="passwd_strong">{TR_PASSWD_STRONG}</label>
                            <div class="form-select">
                                <select name="passwd_strong" id="passwd_strong">
                                    <option value="0"{PASSWD_STRONG_OFF}>{TR_DISABLED}</option>
                                    <option value="1"{PASSWD_STRONG_ON}>{TR_ENABLED}</option>
                                </select>
                            </div>
                        </div>
                        <div class="display form-element">
                            <label for="lostpassword_timeout">{TR_PASSWD_CHARS}</label>
                            <input type="number" class="form-field" name="passwd_chars" id="passwd_chars" min="6" max="32" value="{PASSWD_CHARS}">
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div>{TR_BRUTEFORCE}<span></span></div>
                    <div>
                        <div class="form-element">
                            <label for="bruteforce">{TR_BRUTEFORCE}</label>
                            <div class="form-select">
                                <select name="bruteforce" id="bruteforce">
                                    <option value="0"{BRUTEFORCE_SELECTED_OFF}>{TR_DISABLED}</option>
                                    <option value="1"{BRUTEFORCE_SELECTED_ON}>{TR_ENABLED}</option>
                                </select>
                            </div>
                        </div>
                        <div class="display">
                            <div class="form-element">
                                <label for="bruteforce_between">{TR_BRUTEFORCE_BETWEEN}</label>
                                <div class="form-select">
                                    <select name="bruteforce_between" id="bruteforce_between">
                                        <option value="0"{BRUTEFORCE_BETWEEN_SELECTED_OFF}>{TR_DISABLED}</option>
                                        <option value="1"{BRUTEFORCE_BETWEEN_SELECTED_ON}>{TR_ENABLED}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-element">
                                <label for="bruteforce_max_login">{TR_BRUTEFORCE_MAX_LOGIN}</label>
                                <input type="text" class="form-field" name="bruteforce_max_login" id="bruteforce_max_login" value="{BRUTEFORCE_MAX_LOGIN_VALUE}" maxlength="3">
                            </div>
                            <div class="form-element">
                                <label for="bruteforce_block_time">{TR_BRUTEFORCE_BLOCK_TIME}</label>
                                <input type="text" class="form-field" name="bruteforce_block_time" id="bruteforce_block_time" value="{BRUTEFORCE_BLOCK_TIME_VALUE}" maxlength="3">
                            </div>
                            <div class="form-element">
                                <label for="bruteforce_between_time">{TR_BRUTEFORCE_BETWEEN_TIME}</label>
                                <input type="text" class="form-field" name="bruteforce_between_time" id="bruteforce_between_time" value="{BRUTEFORCE_BETWEEN_TIME_VALUE}" maxlength="3">
                            </div>
                            <div class="form-element">
                                <label for="bruteforce_max_attempts_before_wait">{TR_BRUTEFORCE_MAX_ATTEMPTS_BEFORE_WAIT}</label>
                                <input type="text" class="form-field" name="bruteforce_max_attempts_before_wait" id="bruteforce_max_attempts_before_wait" value="{BRUTEFORCE_MAX_ATTEMPTS_BEFORE_WAIT}" maxlength="3">
                            </div>
                            <div class="form-element">
                                <label for="bruteforce_max_capcha">{TR_BRUTEFORCE_MAX_CAPTCHA}</label>
                                <input type="text" class="form-field" name="bruteforce_max_capcha" id="bruteforce_max_capcha" value="{BRUTEFORCE_MAX_CAPTCHA}" maxlength="3">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div>{TR_MAIL_SETTINGS}<span></span></div>
                    <div>
                        <div class="form-element">
                            <label for="create_default_email_addresses">{TR_CREATE_DEFAULT_EMAIL_ADDRESSES}</label>
                            <div class="form-select">
                                <select name="create_default_email_addresses" id="create_default_email_addresses">
                                    <option value="0"{CREATE_DEFAULT_EMAIL_ADDRESSES_OFF}>{TR_DISABLED}</option>
                                    <option value="1"{CREATE_DEFAULT_EMAIL_ADDRESSES_ON}>{TR_ENABLED}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-element">
                            <label for="count_default_email_addresses">{TR_COUNT_DEFAULT_EMAIL_ADDRESSES}</label>
                            <div class="form-select">
                                <select name="count_default_email_addresses" id="count_default_email_addresses">
                                    <option value="0"{COUNT_DEFAULT_EMAIL_ADDRESSES_OFF}>{TR_DISABLED}</option>
                                    <option value="1"{COUNT_DEFAULT_EMAIL_ADDRESSES_ON}>{TR_ENABLED}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-element">
                            <label for="protect_default_email_addresses">{PROTECT_DEFAULT_EMAIL_ADDRESSES}</label>
                            <div class="form-select">
                                <select name="protect_default_email_addresses" id="protect_default_email_addresses">
                                    <option value="0"{PROTECT_DEFAULT_EMAIL_ADDRESSES_OFF}>{TR_DISABLED}</option>
                                    <option value="1"{PROTECT_DEFAULT_EMAIL_ADDRESSES_ON}>{TR_ENABLED}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-element">
                            <label for="hard_mail_suspension">{TR_HARD_MAIL_SUSPENSION}</label>
                            <div class="form-select">
                                <select name="hard_mail_suspension" id="hard_mail_suspension">
                                    <option value="0"{HARD_MAIL_SUSPENSION_OFF}>{TR_DISABLED}</option>
                                    <option value="1"{HARD_MAIL_SUSPENSION_ON}>{TR_ENABLED}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-element">
                            <label for="email_quota_sync_mode">{TR_EMAIL_QUOTA_SYNC_MODE}</label>
                            <div class="form-select">
                                <select name="email_quota_sync_mode" id="email_quota_sync_mode">
                                    <option value="0"{REDISTRIBUTE_EMAIl_QUOTA_NO}>{TR_NO}</option>
                                    <option value="1"{REDISTRIBUTE_EMAIl_QUOTA_YES}>{TR_YES}</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div>{TR_OTHER_SETTINGS}<span></span></div>
                    <div>
                        <div class="form-element">
                            <label for="def_language">{TR_USER_INITIAL_LANG}</label>
                            <div class="form-select">
                                <select name="def_language" id="def_language">
                                    <!-- BDP: def_language -->
                                    <option value="{LANG_VALUE}"{LANG_SELECTED}>{LANG_NAME}</option>
                                    <!-- EDP: def_language -->
                                </select>
                            </div>
                        </div>
                        <div class="form-element">
                            <label for="support_system">{TR_SUPPORT_SYSTEM}</label>
                            <div class="form-select">
                                <select name="support_system" id="support_system">
                                    <option value="0"{SUPPORT_SYSTEM_SELECTED_OFF}>{TR_DISABLED}</option>
                                    <option value="1"{SUPPORT_SYSTEM_SELECTED_ON}>{TR_ENABLED}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-element">
                            <label for="domain_rows_per_page">{TR_DOMAIN_ROWS_PER_PAGE}</label>
                            <input class="form-field" name="domain_rows_per_page" id="domain_rows_per_page" type="number" min="10" max="100" value="{DOMAIN_ROWS_PER_PAGE}" maxlength="5">
                        </div>
                        <div class="form-element">
                            <label for="log_level">{TR_LOG_LEVEL}</label>
                            <div class="form-select">
                                <select name="log_level" id="log_level">
                                    <option value="0"{LOG_LEVEL_SELECTED_OFF}>{TR_E_USER_OFF}</option>
                                    <option value="E_USER_ERROR"{LOG_LEVEL_SELECTED_ERROR}>{TR_E_USER_ERROR}</option>
                                    <option value="E_USER_WARNING"{LOG_LEVEL_SELECTED_WARNING}>{TR_E_USER_WARNING}</option>
                                    <option value="E_USER_NOTICE"{LOG_LEVEL_SELECTED_NOTICE}>{TR_E_USER_NOTICE}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-element">
                            <label for="prevent_external_login_admin">{TR_PREVENT_EXTERNAL_LOGIN_ADMIN}</label>
                            <div class="form-select">
                                <select name="prevent_external_login_admin" id="prevent_external_login_admin">
                                    <option value="0"{PREVENT_EXTERNAL_LOGIN_ADMIN_SELECTED_OFF}>{TR_DISABLED}</option>
                                    <option value="1"{PREVENT_EXTERNAL_LOGIN_ADMIN_SELECTED_ON}>{TR_ENABLED}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-element">
                            <label for="prevent_external_login_reseller">{TR_PREVENT_EXTERNAL_LOGIN_RESELLER}</label>
                            <div class="form-select">
                                <select name="prevent_external_login_reseller" id="prevent_external_login_reseller">
                                    <option value="0"{PREVENT_EXTERNAL_LOGIN_RESELLER_SELECTED_OFF}>{TR_DISABLED}</option>
                                    <option value="1"{PREVENT_EXTERNAL_LOGIN_RESELLER_SELECTED_ON}>{TR_ENABLED}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-element">
                            <label for="prevent_external_login_client">{TR_PREVENT_EXTERNAL_LOGIN_CLIENT}</label>
                            <div class="form-select">
                                <select name="prevent_external_login_client" id="prevent_external_login_client">
                                    <option value="0"{PREVENT_EXTERNAL_LOGIN_CLIENT_SELECTED_OFF}>{TR_DISABLED}</option>
                                    <option value="1"{PREVENT_EXTERNAL_LOGIN_CLIENT_SELECTED_ON}>{TR_ENABLED}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-element">
                            <label for="enableSSL">{TR_ENABLE_SSL}</label>
                            <div class="form-select">
                                <select name="enableSSL" id="enableSSL">
                                    <option value="0"{ENABLE_SSL_OFF}>{TR_DISABLED}</option>
                                    <option value="1"{ENABLE_SSL_ON}>{TR_ENABLED}</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-element full-width">
                <div class="action">
                    <button class="btn" name="Submit" type="submit">
                        {TR_UPDATE}
                    </button>
                </div>
            </div>
        </section>
    </div>
</form>
