<form name="edit_ftp_account_frm" method="post" action="ftp_edit.php?id={ID}" autocomplete="off">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_FTP_USER_DATA}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="username">{TR_USERNAME}</label>
                <input class="form-field" type="text" id="username" name="username" value="{USERNAME}" disabled="disabled">
            </div>
            <div class="form-element">
                <label for="password">{TR_PASSWORD}</label>
                <input class="form-field pwd_generator" type="password" id="password" name="password" value="" autocomplete="new-password">
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
                        {TR_CHANGE}
                    </button>
                    <a href="ftp_accounts.php" class="btn muted">{TR_CANCEL}</a>
                </div>
            </div>
        </section>
    </div>
</form>
