<!-- BDP: sql_databases_users_list -->
<script>
    function action_delete(url, subject, object) {
        var msg;
        if (object == 'database') {
            msg = "{TR_DATABASE_MESSAGE_DELETE}"
        } else {
            msg = "{TR_USER_MESSAGE_DELETE}"
        }

        return jQuery.imscp.confirm(sprintf(msg, subject), function(ret) {
            if(ret) {
                window.location.href = url;
            }
        });
    }
</script>

<h2>{TR_DATABASE}</h2>
<div id="sql-list">
    <!-- BDP: sql_databases_list -->
    <div class="box">
        <h3>{DB_NAME}</h3>
        <ul>
            <!-- BDP: sql_users_list -->
            <li>
                <p>
                    <strong>{TR_DB_USER}</strong>
                    <span>{DB_USER}</span>
                </p>
                <p>
                    <strong>
                        {TR_DB_USER_HOST}
                        <span class="tooltip-circle" data-tooltip="{TR_DB_USER_HOST_TOOLTIP}">
                            <i data-eva="question-mark-circle"></i>
                        </span>
                    </strong>
                    <span>{DB_USER_HOST}</span>
                </p>
                <div class="buttons">
                    <a href="sql_change_password.php?sqlu_id={SQLU_ID}" data-tooltip="{TR_CHANGE_PASSWORD}">
                        <i data-eva="edit"></i>
                    </a>
                    <a href="#" onclick="return action_delete('sql_delete_user.php?sqlu_id={SQLU_ID}', '{DB_USER_JS}', 'user')" data-tooltip="{TR_DELETE}">
                        <i data-eva="trash-2"></i>
                    </a>
                </div>
            </li>
            <!-- EDP: sql_users_list -->
        </ul>
        <div class="buttons">
            <!-- BDP: sql_user_add_link -->
            <a href="sql_user_add.php?sqld_id={SQLD_ID}" class="btn sm">{TR_ADD_USER}</a>
            <!-- EDP: sql_user_add_link -->
            <a href="#" class="btn sm danger" onclick="return action_delete('sql_database_delete.php?sqld_id={SQLD_ID}', '{DB_NAME_JS}', 'database')">{TR_DELETE}</a>
        </div>
    </div>
    <!-- EDP: sql_databases_list -->
</div>

<!-- EDP: sql_databases_users_list -->
