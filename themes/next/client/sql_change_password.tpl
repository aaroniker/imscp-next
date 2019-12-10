<form method="post" action="sql_change_password.php?sqlu_id={SQLU_ID}" autocomplete="off">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_SQL_USER_PASSWORD}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="user">{TR_DB_USER}</label>
                <input class="form-field" id="user" type="text" name="user" value="{USER_NAME}" readonly>
            </div>
            <div class="form-element">
                <label for="password">{TR_PASSWORD}</label>
                <input class="form-field pwd_generator" type="password" name="password" id="password" value="" autocomplete="new-password" required>
            </div>
            <div class="form-element">
                <label for="cpassword">{TR_PASSWORD_CONFIRMATION}</label>
                <input class="form-field" type="password" name="password_confirmation" id="cpassword" value="" autocomplete="new-password" required>
            </div>
            <div class="form-element full-width">
                <div class="action">
                    <input type="hidden" name="sqlu_id" value="{SQLU_ID}">
                    <button class="btn" name="Submit" type="submit">
                        {TR_UPDATE}
                    </button>
                    <a href="sql_manage.php" class="btn muted">{TR_CANCEL}</a>
                </div>
            </div>
        </section>
    </div>
</form>
