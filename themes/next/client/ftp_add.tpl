<script>
    $(function () {
        $('#domain_type').change(function() {
            $.post('ftp_add.php', {
                'domain_type': this.value
            }, data => {
                let select = $("#domain_name");
                select.empty();
                for(let i = 0; i < data.length; i++) {
                    select.append('<option value="' + data[i].domain_name_val + '">' + data[i].domain_name + '</option>');
                }
            }, 'json');
        });
    });
</script>

<form name="add_ftp_account_frm" method="post" action="ftp_add.php" autocomplete="off">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_FTP_ACCOUNT_DATA}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="domain_type">{TR_DOMAIN_TYPE_LABEL}</label>
                <div class="form-select">
                    <select id="domain_type" name="domain_type">
                        <!-- BDP: domain_types -->
                        <option value="{DOMAIN_TYPE}"{DOMAIN_TYPE_SELECTED}>{TR_DOMAIN_TYPE}</option>
                        <!-- EDP: domain_types -->
                    </select>
                </div>
            </div>
            <div class="form-element">
                <label for="username">{TR_USERNAME}</label>
                <div class="form-group">
                    <input class="form-field" type="text" id="username" name="username" value="{USERNAME}">
                    <span class="sm">@</span>
                    <div class="form-select">
                        <select id="domain_name" name="domain_name">
                            <!-- BDP: domain_list -->
                            <option value="{DOMAIN_NAME_VAL}"{DOMAIN_NAME_SELECTED}>{DOMAIN_NAME}</option>
                            <!-- EDP: domain_list -->
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-element">
                <label for="password">{TR_PASSWORD}</label>
                <input class="form-field pwd_generator pwd_prefill" type="password" id="password" name="password" value="" autocomplete="new-password">
            </div>
            <div class="form-element">
                <label for="cpassword">{TR_PASSWORD_REPEAT}</label>
                <input class="form-field" type="password" id="cpassword" name="password_repeat" value="" autocomplete="new-password">
            </div>
            <div class="form-element">
                <label for="ftp_directory">{TR_HOME_DIR}</label>
                <div class="form-group">
                    <input class="form-field" type="text" id="ftp_directory" name="home_dir" value="{HOME_DIR}">
                    <a href="" class="btn ftp_choose_dir">
                        {TR_CHOOSE_DIR}
                    </a>
                </div>
            </div>
            <div class="form-element">
                <div class="action">
                    <button name="Submit" type="submit" class="btn">
                        {TR_ADD}
                    </button>
                    <a href="ftp_accounts.php" class="btn muted">{TR_CANCEL}</a>
                </div>
            </div>
        </section>
    </div>
</form>
