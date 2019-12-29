<form action="" method="post" id="update_autoresponder_message">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_TITLE}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="autoresponder_message">{TR_AUTORESPONDER_MESSAGE}</label>
                <textarea class="form-field" id="autoresponder_message" name="autoresponder_message">{AUTORESPONDER_MESSAGE}</textarea>
            </div>
            <div class="form-element">
                <div class="action">
                    <button name="Submit" type="submit" class="btn">
                        {TR_ACTION}
                    </button>
                    <a href="mail_accounts.php" class="btn muted">{TR_CANCEL}</a>
                    <input type="hidden" name="id" value="{MAIL_ACCOUNT_ID}">
                </div>
            </div>
        </section>
    </div>
</form>
