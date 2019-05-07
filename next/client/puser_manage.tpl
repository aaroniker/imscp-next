
<script>
    function action_delete(url, subject) {
        return jQuery.imscp.confirm(sprintf("{TR_MESSAGE_DELETE}", subject), function(ret) {
            if(ret) {
                window.location.href = url;
            }
        });
    }
</script>
<h2 class="groups"><span>{TR_USERS}</span></h2>
<!-- BDP: users_message_block -->
<div class="static_info">{USERS_MESSAGE}</div>
<!-- EDP: users_message_block -->
<!-- BDP: users_block -->
<table class="firstColFixed">
    <thead>
    <tr>
        <th>{TR_USERNAME}</th>
        <th>{TR_STATUS}</th>
        <th>{TR_ACTIONS}</th>
    </tr>
    </thead>
    <tbody>
    <!-- BDP: user_block -->
    <tr>
        <td>{UNAME}</td>
        <td>{USTATUS}</td>
        <td>
            <a href="protected_user_assign.php?uname={USER_ID}" class="icon i_users">{TR_GROUP}</a>
            <a href="{USER_EDIT_SCRIPT}" class="icon i_edit">{USER_EDIT}</a>
            <a href="#" class="icon i_delete" onclick="return {USER_DELETE_SCRIPT}">{USER_DELETE}</a>
        </td>
    </tr>
    <!-- EDP: user_block -->
    </tbody>
</table>
<!-- EDP: users_block -->
<div class="buttons">
    <a class="link_as_button" href="protected_user_add.php">{TR_ADD_USER}</a>
</div>
<h2 class="groups"><span>{TR_GROUPS}</span></h2>
<!-- BDP: groups_message_block -->
<div class="static_info">{GROUPS_MESSAGE}</div>
<!-- EDP: groups_message_block -->
<!-- BDP: group_blocks -->
<table class="firstColFixed">
    <thead>
    <tr>
        <th>{TR_GROUPNAME}</th>
        <th>{TR_GROUP_MEMBERS}</th>
        <th>{TR_STATUS}</th>
        <th>{TR_ACTIONS}</th>
    </tr>
    </thead>
    <tbody>
    <!-- BDP: group_block -->
    <tr>
        <td>{GNAME}</td>
        <td>{MEMBER}</td>
        <td>{GSTATUS}</td>
        <td><a href="#" class="icon i_delete" onclick="{GROUP_DELETE_SCRIPT}">{GROUP_DELETE}</a></td>
    </tr>
    <!-- EDP: group_block -->
    </tbody>
</table>
<!-- EDP: group_blocks -->
<div class="buttons">
    <a class="link_as_button" href="protected_group_add.php">{TR_ADD_GROUP}</a>
    <a class="link_as_button" href="protected_areas.php">{TR_CANCEL}</a>
</div>
