<form id="simple-form" name="login" action="index.php" method="post">

    <div class="form-element">
        <label for="username">{TR_USERNAME}</label>
        <input type="text" class="form-field" name="uname" id="username" value="{UNAME}">
    </div>

    <div class="form-element">
        <label for="password">{TR_PASSWORD}</label>
        <input type="password" class="form-field" name="upass" id="password" value="">
    </div>

    <div class="action">
        <!-- BDP: lost_password_support -->
        <a href="lostpassword.php">
            <i data-eva="question-mark-circle" data-eva-fill="currentColor"></i>
            {TR_LOSTPW}
        </a>
        <!-- EDP: lost_password_support -->
        <button class="btn" type="submit" name="Submit">
            <i data-eva="unlock" data-eva-fill="currentColor"></i>
            {TR_LOGIN}
        </button>
    </div>

    <!-- BDP: ssl_support -->
    <a class="{SSL_IMAGE_CLASS}" href="{SSL_LINK}" title="{TR_SSL_DESCRIPTION}">{TR_SSL}</a>
    <!-- EDP: ssl_support -->

    <input type="hidden" name="action" value="login">
</form>
