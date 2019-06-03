<form method="post" action="sql_database_add.php">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_DATABASE}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="db_name">{TR_DB_NAME}</label>
                <input class="form-field" type="text" name="db_name" id="db_name" value="{DB_NAME}">
            </div>
            <div class="form-element">
                <label>{TR_USE_DMN_ID}</label>
                <div class="form-group">
                    <!-- BDP: mysql_prefix_yes -->
                    <div class="toggle">
                        <label class="checkbox">
                            <input type="checkbox" name="use_dmn_id" {USE_DMN_ID}>
                            <span></span>
                        </label>
                    </div>
                    <!-- EDP: mysql_prefix_yes -->
                    <!-- BDP: mysql_prefix_all -->
                    <div class="form-select">
                        <select name="id_pos">
                            <option value="start"{START_ID_POS_SELECTED}>{TR_START_ID_POS}</option>
                            <option value="end"{END_ID_POS_SELECTED}>{TR_END_ID_POS}</option>
                        </select>
                    </div>
                    <!-- EDP: mysql_prefix_all -->
                </div>
            </div>
            <!-- BDP: mysql_prefix_no -->
            <input type="hidden" name="use_dmn_id" value="on">
            <!-- EDP: mysql_prefix_no -->
            <!-- BDP: mysql_prefix_infront -->
            <input type="hidden" name="id_pos" value="start" checked="checked">{TR_START_ID_POS}
            <!-- EDP: mysql_prefix_infront -->
            <!-- BDP: mysql_prefix_behind -->
            <input type="hidden" name="id_pos" value="end" checked="checked">{TR_END_ID_POS}
            <!-- EDP: mysql_prefix_behind -->
            <div class="form-element">
                <div class="action">
                    <button name="Submit" type="submit" class="btn">
                        {TR_ADD}
                    </button>
                    <a href="sql_manage.php" class="btn muted">{TR_CANCEL}</a>
                </div>
            </div>
        </section>
    </div>
</form>
