<form action="settings_maintenance_mode.php" method="post" name="maintenancemode_frm" id="maintenancemode_frm">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_MAINTENANCE_MESSAGE}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="maintenancemode_message">{TR_MESSAGE}</label>
                <textarea class="form-field" name="maintenancemode_message" id="maintenancemode_message">{MESSAGE_VALUE}</textarea>
            </div>
            <div class="form-element">
                <label for="maintenancemode">{TR_MAINTENANCEMODE}</label>
                <div class="form-select">
                    <select name="maintenancemode" id="maintenancemode">
                        <option value="0" {SELECTED_OFF}>{TR_DISABLED}</option>
                        <option value="1" {SELECTED_ON}>{TR_ENABLED}</option>
                    </select>
                </div>
            </div>
            <div class="form-element full-width">
                <div class="action">
                    <button class="btn" name="Submit" type="submit">
                        {TR_APPLY}
                    </button>
                    <input type="hidden" name="uaction" value="apply">
                </div>
            </div>
        </section>
    </div>
</form>
