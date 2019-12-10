<!-- BDP: show_sqluser_list -->
<form method="post" action="sql_user_add.php">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_ASSIGN_EXISTING_SQL_USER}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="sqluser_id">{TR_SQL_USER_NAME}</label>
                <div class="form-select">
                    <!--email_off-->
                    <select name="sqluser_id" id="sqluser_id">
                        <!-- BDP: sqluser_list -->
                        <option value="{SQLUSER_ID}">{SQLUSER_IDN}</option>
                        <!-- EDP: sqluser_list -->
                    </select>
                    <!--/email_off-->
                </div>
            </div>
            <div class="form-element">
                <div class="action">
                    <button name="reuse_sqluser" type="submit" class="btn">
                        {TR_ADD_EXIST}
                    </button>
                    <a href="sql_manage.php" class="btn muted">{TR_CANCEL}</a>
                </div>
            </div>
        </section>
    </div>
    <input type="hidden" name="uaction" value="add_user">
    <input type="hidden" name="sqld_id" value="{SQLD_ID}">
</form>
<!-- EDP: show_sqluser_list -->
<!-- BDP: create_sqluser -->
<form method="post" action="sql_user_add.php" autocomplete="off">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_NEW_SQL_USER_DATA}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="user_name">{TR_USER_NAME}</label>
                <input class="form-field" type="text" id="user_name" name="user_name" value="{USER_NAME}">
            </div>
            <div class="form-element">
                <label for="user_host">
                    {TR_USER_HOST}
                    <span class="tooltip-circle" data-tooltip="{TR_USER_HOST_TIP}">
                        <i data-eva="question-mark-circle"></i>
                    </span>
                </label>
                <input class="form-field" type="text" id="user_host" name="user_host" value="{USER_HOST}">
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
            <input type="hidden" name="id_pos" value="start" checked>{TR_START_ID_POS}
            <!-- EDP: mysql_prefix_infront -->
            <!-- BDP: mysql_prefix_behind -->
            <input type="hidden" name="id_pos" value="end" checked>{TR_END_ID_POS}
            <!-- EDP: mysql_prefix_behind -->
            <div class="form-element">
                <label for="password">{TR_PASS}</label>
                <input class="form-field pwd_generator pwd_prefill" type="password" name="pass" id="password" value="" autocomplete="new-password" required>
            </div>
            <div class="form-element">
                <label for="cpassword">{TR_PASS_REP}</label>
                <input class="form-field" type="password" name="pass_rep" id="cpassword" value="" autocomplete="new-password">
            </div>
            <div class="form-element">
                <div class="action">
                    <button name="Add_New" type="submit" class="btn">
                        {TR_ADD}
                    </button>
                    <a href="sql_manage.php" class="btn muted">{TR_CANCEL}</a>
                </div>
            </div>
        </section>
    </div>
    <input type="hidden" name="uaction" value="add_user">
    <input type="hidden" name="sqld_id" value="{SQLD_ID}">
</form>
<!-- EDP: create_sqluser -->
