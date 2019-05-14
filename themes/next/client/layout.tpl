<!-- BDP: layout_colors_block -->
<form method="post" action="layout.php">
    <input type="hidden" name="uaction" value="changeLayoutColor">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_LAYOUT_COLOR}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="layoutColor">{TR_CHOOSE_LAYOUT_COLOR}</label>
                <div class="form-select">
                    <select name="layoutColor" id="layoutColor">
                        <!-- BDP: layout_color_block -->
                        <option value="{COLOR}" {SELECTED_COLOR}>{COLOR}</option>
                        <!-- EDP: layout_color_block -->
                    </select>
                </div>
            </div>
            <div class="form-element">
                <div class="action">
                    <button class="btn" type="submit" name="Submit">
                        {TR_UPDATE}
                    </button>
                </div>
            </div>
        </section>
    </div>
</form>
<!-- EDP: layout_colors_block -->

<form method="post" action="layout.php">
    <input type="hidden" name="uaction" value="changeShowLabels">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_OTHER_SETTINGS}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="mainMenuShowLabels">{TR_MAIN_MENU_SHOW_LABELS}</label>
                <div class="form-select">
                    <select name="mainMenuShowLabels" id="mainMenuShowLabels">
                        <option value="0"{MAIN_MENU_SHOW_LABELS_OFF}>{TR_DISABLED}</option>
                        <option value="1"{MAIN_MENU_SHOW_LABELS_ON}>{TR_ENABLED}</option>
                    </select>
                </div>
            </div>
            <div class="form-element">
                <div class="action">
                    <button class="btn" type="submit" name="Submit">
                        {TR_UPDATE}
                    </button>
                </div>
            </div>
        </section>
    </div>
</form>
