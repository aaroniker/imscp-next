<form name="circular_frm" method="post" action="circular.php">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_CIRCULAR}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="sender_name">{TR_SENDER_NAME}</label>
                <input class="form-field" type="text" name="sender_name" id="sender_name" value="{SENDER_NAME}">
            </div>
            <div class="form-element">
                <label for="sender_email">{TR_SENDER_EMAIL}</label>
                <input class="form-field" type="text" name="sender_email" id="sender_email" value="{SENDER_EMAIL}">
            </div>
            <div class="form-element">
                <label for="rcpt_to">{TR_SEND_TO}</label>
                <div class="form-select">
                    <select id="rcpt_to" name="rcpt_to">
                        <!-- BDP: rcpt_to_option -->
                        <option value="{RCPT_TO}"{SELECTED}>{TR_RCPT_TO}</option>
                        <!-- EDP: rcpt_to_option -->
                    </select>
                </div>
            </div>
            <div class="form-element">
                <label for="subject">{TR_SUBJECT}</label>
                <input class="form-field" type="text" name="subject" id="subject" value="{SUBJECT}">
            </div>
            <div class="form-element">
                <label for="body">{TR_BODY}</label>
                <textarea class="form-field" name="body" id="body">{BODY}</textarea>
            </div>
            <div class="form-element full-width">
                <div class="action">
                    <button class="btn" name="Submit" type="submit">
                        {TR_SEND_CIRCULAR}
                    </button>
                    <a href="users.php" class="btn muted">{TR_CANCEL}</a>
                </div>
            </div>
        </section>
    </div>
</form>
