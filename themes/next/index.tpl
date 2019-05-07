<form name="login" action="index.php" method="post">

    <label for="username">{TR_USERNAME}</label>
    <input type="text" name="uname" id="username" value="{UNAME}">

    <label for="password">{TR_PASSWORD}</label>
    <input type="password" name="upass" id="password" value="">

    <!-- BDP: lost_password_support -->
    <a href="lostpassword.php">{TR_LOSTPW}</a>
    <!-- EDP: lost_password_support -->
    <button type="submit" name="Submit">{TR_LOGIN}</button>

    <!-- BDP: ssl_support -->
    <a class="{SSL_IMAGE_CLASS}" href="{SSL_LINK}" title="{TR_SSL_DESCRIPTION}">{TR_SSL}</a>
    <!-- EDP: ssl_support -->

    <input type="hidden" name="action" value="login">
</form>
