<!-- BDP: languages_available -->
<form name="client_change_language" method="post" action="language.php">
    <div class="form horizontal">
        <header>
            <h3>{TR_LANGUAGE}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="def_language">{TR_CHOOSE_LANGUAGE}</label>
                <div class="form-select">
                    <select name="def_language" id="def_language">
                        <!-- BDP: def_language -->
                        <option value="{LANG_VALUE}" {LANG_SELECTED}>{LANG_NAME}</option>
                        <!-- EDP: def_language -->
                    </select>
                </div>
            </div>
            <div class="form-element">
                <button name="Submit" type="submit" class="btn">
                    {TR_UPDATE}
                </button>
            </div>
        </section>
    </div>
</form>
<!-- EDP: languages_available -->
