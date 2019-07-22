
<script>
    $(function () {
        var errFieldsStack = {ERR_FIELDS_STACK};

        $.each(errFieldsStack, function() {
            $('#' + this).addClass('error');
        });

        $(".datatable").dataTable({
            language: imscp_i18n.core.dataTable,
            pagingType: "simple"
        });
    });
</script>

<!-- BDP: menus_list_block -->
<div class="table sectionBox">
    <header>
        <h3>{TR_TITLE}</h3>
    </header>
    <div>
        <table>
            <thead>
                <th>Name</th>
                <th>{TR_TH_LEVEL}</th>
                <th>{TR_MENU_ORDER}</th>
                <th></th>
            </thead>
            <tbody>
                <!-- BDP: menu_block -->
                <tr>
                    <td data-th="{TR_MENU_NAME_AND_LINK}">
                        <a class="strong-block" href="{LINK}" target="_blank">{MENU_NAME}</a>
                        <small>{LINK}</small>
                    </td>
                    <td data-th="{TR_TH_LEVEL}">{LEVEL}</td>
                    <td data-th="{TR_MENU_ORDER}">{ORDER}</td>
                    <td>
                        <div class="action-column">
                            <a class="btn sm" href="custom_menus.php?edit_id={MENU_ID}">{TR_EDIT}</a>
                            <a class="btn sm" href="custom_menus.php?delete_id={MENU_ID}" onclick="return jQuery.imscp.confirmOnclick(this, sprintf('{TR_MESSAGE_DELETE_JS}', '{MENU_NAME_JS}'))">{TR_DELETE}</a>
                        </div>
                    </td>
                </tr>
                <!-- EDP: menu_block -->
            </tbody>
        </table>
    </div>
</div>
<!-- EDP: menus_list_block -->

<form name="menuFrm" method="post" action="custom_menus.php">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_CUSTOM_MENU_PROPERTIES}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="menu_name">{TR_MENU_NAME}</label>
                <input class="form-field" type="text" name="menu_name" id="menu_name" value="{MENU_NAME}">
            </div>
            <div class="form-element">
                <label for="menu_link">{TR_MENU_LINK}</label>
                <input class="form-field" type="text" name="menu_link" id="menu_link" value="{MENU_LINK}">
            </div>
            <div class="form-element">
                <label for="menu_target">{TR_MENU_TARGET}</label>
                <div class="form-select">
                    <select id="menu_target" name="menu_target">
                        <!-- BDP: menu_target_block -->
                        <option value="{TARGET_VALUE}"{SELECTED_TARGET}>{TR_TARGET}</option>
                        <!-- EDP: menu_target_block -->
                    </select>
                </div>
            </div>
            <div class="form-element">
                <label for="menu_level">{TR_VIEW_FROM}</label>
                <div class="form-select">
                    <select name="menu_level" id="menu_level">
                        <!-- BDP: menu_level_block -->
                        <option value="{LEVEL_VALUE}"{SELECTED_LEVEL}>{TR_LEVEL}</option>
                        <!-- EDP: menu_level_block -->
                    </select>
                </div>
            </div>
            <div class="form-element">
                <label for="menu_order">{TR_MENU_ORDER} <small>({TR_OPTIONAL})</small></label>
                <input class="form-field" type="number" name="menu_order" id="menu_order" min="0" value="{MENU_ORDER}">
            </div>
            <div class="form-element full-width">
                <div class="action">
                    <!-- BDP: add_menu -->
                    <button class="btn" name="addMenu" type="button" onclick="return sbmt(document.forms[0], 'menu_add');">
                        {TR_ADD}
                    </button>
                    <a href="settings.php" class="btn muted">{TR_CANCEL}</a>
                    <!-- EDP: add_menu -->
                    <!-- BDP: edit_menu -->
                    <button class="btn" name="editMenu" type="button" onclick="return sbmt(document.forms[0], 'menu_update');">
                        {TR_UPDATE}
                    </button>
                    <a href="custom_menus.php" class="btn muted">{TR_CANCEL}</a>
                    <input type="hidden" name="edit_id" value="{EDIT_ID}">
                    <!-- EDP: edit_menu -->
                    <input type="hidden" name="uaction" value="">
                </div>
            </div>
        </section>
    </div>
</form>
