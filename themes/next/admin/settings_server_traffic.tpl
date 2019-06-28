<form action="settings_server_traffic.php" method="post" name="serverTrafficFrm">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_SET_SERVER_TRAFFIC_SETTINGS}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="max_traffic">{TR_MAX_TRAFFIC}</label>
                <div class="form-group">
                    <input class="form-field" name="max_traffic" type="number" min="0" max="2147483647" id="max_traffic" value="{MAX_TRAFFIC}">
                    <span>{TR_MIB}</span>
                </div>
            </div>
            <div class="form-element">
                <label for="traffic_warning">{TR_WARNING}</label>
                <div class="form-group">
                    <input class="form-field" name="traffic_warning" type="number" min="0" max="2147483647" id="traffic_warning" value="{TRAFFIC_WARNING}">
                    <span>{TR_MIB}</span>
                </div>
            </div>
            <div class="form-element full-width">
                <div class="action">
                    <button class="btn" name="Submit" type="submit">
                        {TR_UPDATE}
                    </button>
                </div>
            </div>
        </section>
    </div>
</form>
