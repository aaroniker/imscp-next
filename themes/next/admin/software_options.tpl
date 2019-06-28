<form action="software_options.php" method="post" name="appssettings" id="appssettings">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_MAIN_OPTIONS}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="use_webdepot">{TR_USE_WEBDEPOT}</label>
                <div class="form-select">
                    <select name="use_webdepot" id="use_webdepot">
                        <option value="0"{USE_WEBDEPOT_SELECTED_OFF}>{TR_DISABLED}</option>
                        <option value="1"{USE_WEBDEPOT_SELECTED_ON}>{TR_ENABLED}</option>
                    </select>
                </div>
            </div>
            <div class="form-element">
                <label for="webdepot_xml_url">{TR_WEBDEPOT_XML_URL}</label>
                <input class="form-field" type="text" name="webdepot_xml_url" id="webdepot_xml_url" value="{WEBDEPOT_XML_URL_VALUE}">
            </div>
            <div class="form-element">
                <label>{TR_WEBDEPOT_LAST_UPDATE}</label>
                <p class="static">{WEBDEPOT_LAST_UPDATE_VALUE}</p>
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
