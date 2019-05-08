<form id="simple-form" name="lostpasswordFrm" action="lostpassword.php" method="post">

    <div class="form-element">
        <a href="lostpassword.php" title="{GET_NEW_IMAGE}">
            <img id="captcha" src="imagecode.php" width="{CAPTCHA_WIDTH}" height="{CAPTCHA_HEIGHT}" alt="captcha image">
        </a>
    </div>

    <div class="form-element">
        <label for="capcode">{TR_CAPCODE}</label>
        <input type="text" class="form-field" name="capcode" id="capcode">
    </div>

    <div class="form-element">
        <label for="username">{TR_USERNAME}</label>
        <input type="text" class="form-field" name="uname" id="username" value="{UNAME}">
    </div>

    <div class="action">
        <a href="/">
            <i data-eva="close-circle" data-eva-fill="currentColor"></i>
            {TR_CANCEL}
        </a>
        <button class="btn" type="submit" name="Submit">
            <i data-eva="email" data-eva-fill="currentColor"></i>
            {TR_SEND}
        </button>
    </div>

</form>
