<form name="admin_email_setup" method="post" action="settings_welcome_mail.php">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_TITLE}</h3>
        </header>
        <section>
            <h4>{TR_MESSAGE_TEMPLATE_INFO}</h4>
            <div class="form-element">
                <label for="user">{TR_USER_LOGIN_NAME}</label>
                <p class="static">{USERNAME}</p>
            </div>
            <div class="form-element">
                <label for="user">{TR_USER_PASSWORD}</label>
                <p class="static">{PASSWORD}</p>
            </div>
            <div class="form-element">
                <label for="user">{TR_USER_REAL_NAME}</label>
                <p class="static">{NAME}</p>
            </div>
            <div class="form-element">
                <label for="user">{TR_USERTYPE}</label>
                <p class="static">{USERTYPE}</p>
            </div>
            <div class="form-element">
                <label for="user">{TR_BASE_SERVER_VHOST_PREFIX}</label>
                <p class="static">{BASE_SERVER_VHOST_PREFIX}</p>
            </div>
            <div class="form-element">
                <label for="user">{TR_BASE_SERVER_VHOST}</label>
                <p class="static">{BASE_SERVER_VHOST}</p>
            </div>
            <div class="form-element">
                <label for="user">{TR_BASE_SERVER_VHOST_PORT}</label>
                <p class="static">{BASE_SERVER_VHOST_PORT}</p>
            </div>
            <h4>{TR_MESSAGE_TEMPLATE}</h4>
            <div class="form-element">
                <label for="user">{TR_SUBJECT}</label>
                <input class="form-field" type="text" name="auto_subject" id="auto_subject" value="{SUBJECT_VALUE}">
            </div>
            <div class="form-element">
                <label for="user">{TR_MESSAGE}</label>
                <textarea class="form-field" name="auto_message" id="auto_message">{MESSAGE_VALUE}</textarea>
            </div>
            <div class="form-element">
                <label for="user">{TR_SENDER_EMAIL}</label>
                <p class="static">{SENDER_EMAIL_VALUE}</p>
            </div>
            <div class="form-element">
                <label for="user">{TR_SENDER_NAME}</label>
                <p class="static">{SENDER_NAME_VALUE}</p>
            </div>
            <div class="form-element">
                <div class="action">
                    <button class="btn" name="Submit" type="submit">
                        {TR_UPDATE}
                    </button>
                    <input type="hidden" name="uaction" value="email_setup">
                </div>
            </div>
        </section>
    </div>
</form>
