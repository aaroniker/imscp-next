<form action="settings_lostpassword.php" method="post" name="frmlostpassword" id="frmlostpassword">
    <input type="hidden" name="sender_email" value="{SENDER_EMAIL_VALUE}">
    <input type="hidden" name="sender_name" value="{SENDER_NAME_VALUE}">

    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_ACTIVATION_EMAIL}</h3>
        </header>
        <section>
            <h4>{TR_MESSAGE_TEMPLATE_INFO}</h4>
            <div class="form-element">
                <label for="user">{TR_USER_LOGIN_NAME}</label>
                <p class="static">{USERNAME}</p>
            </div>
            <div class="form-element">
                <label for="user">{TR_LOSTPW_LINK}</label>
                <p class="static">{LINK}</p>
            </div>
            <div class="form-element">
                <label for="user">{TR_USER_REAL_NAME}</label>
                <p class="static">{NAME}</p>
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
                <label for="subject1">{TR_SUBJECT}</label>
                <input name="subject1" type="text" id="subject1" class="form-field" value="{SUBJECT_VALUE1}">
            </div>
            <div class="form-element">
                <label for="message1">{TR_MESSAGE}</label>
                <textarea class="form-field" rows="10" name="message1" id="message1">{MESSAGE_VALUE1}</textarea>
            </div>
            <div class="form-element">
                <label for="user">{TR_SENDER_EMAIL}</label>
                <p class="static">{SENDER_EMAIL_VALUE}</p>
            </div>
            <div class="form-element">
                <label for="user">{TR_SENDER_NAME}</label>
                <p class="static">{SENDER_NAME_VALUE}</p>
            </div>
            <div class="form-element full-width">
                <div class="action">
                    <button class="btn" name="Submit" type="submit">
                        {TR_APPLY_CHANGES}
                    </button>
                    <input type="hidden" name="uaction" value="apply">
                </div>
            </div>
        </section>
    </div>

    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_PASSWORD_EMAIL}</h3>
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
                <label for="subject2">{TR_SUBJECT}</label>
                <input name="subject2" type="text" id="subject2" class="form-field" value="{SUBJECT_VALUE2}">
            </div>
            <div class="form-element">
                <label for="message2">{TR_MESSAGE}</label>
                <textarea class="form-field" rows="10" name="message2" id="message2">{MESSAGE_VALUE2}</textarea>
            </div>
            <div class="form-element">
                <label for="user">{TR_SENDER_EMAIL}</label>
                <p class="static">{SENDER_EMAIL_VALUE}</p>
            </div>
            <div class="form-element">
                <label for="user">{TR_SENDER_NAME}</label>
                <p class="static">{SENDER_NAME_VALUE}</p>
            </div>
            <div class="form-element full-width">
                <div class="action">
                    <button class="btn" name="Submit" type="submit">
                        {TR_APPLY_CHANGES}
                    </button>
                    <input type="hidden" name="uaction" value="apply">
                </div>
            </div>
        </section>
    </div>

</form>
