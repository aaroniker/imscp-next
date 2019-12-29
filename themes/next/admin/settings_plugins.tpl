
<script>
    $(function () {

        $('#bulkActionsTop, #bulkActionsBottom').change(function() {
            $('select[name="bulkActions"] option[value=' + $(this).val() + ']').attr('selected', 'selected');
        });

        $('thead :checkbox').change(function() {
            $('table :checkbox').prop('checked', $(this).is(':checked'));
        });

        $(document).on('click', '.plugin_error', function() {

            let errDialog = $('<div>' + $.trim($(this).html()) + '</div>'),
                pluginName = $(this).attr('id');

            errDialog.dialog(window.dialogOptions({
                title: pluginName + " " + imscp_i18n.core.error_details,
                buttons: [
                    {
                        text: imscp_i18n.core.force_retry,
                        class: 'btn sm',
                        click() {
                            window.location.replace('?retry=' + pluginName)
                        }
                    },
                    {
                        text: imscp_i18n.core.close,
                        class: 'btn muted sm',
                        click() {
                            $(this).dialog('close').dialog('destroy')
                        }
                    }
                ]
            }));

            return false;

        });

        $('#bulk_actions').on('change', function () {
            $('#bulk_actions_submit').prop('disabled', $(this).val() == 'noaction');
        });

    });
</script>

<div class="message static_info">{TR_PLUGIN_HINT}</div>

<!-- BDP: plugins_block -->
<form name="plugin_frm" action="settings_plugins.php" method="post">
    <div class="sectionBox table">
        <header>
            <h3>{TR_TITLE}</h3>
        </header>
        <table>
            <thead class="middle">
                <tr>
                    <th class="toggle">
                        <label class="checkbox noMargin">
                            <input type="checkbox">
                            <span></span>
                        </label>
                    </th>
                    <th>{TR_PLUGIN}</th>
                    <th>{TR_DESCRIPTION}</th>
                    <th>{TR_STATUS}</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <!-- BDP: plugin_block -->
                <tr>
                    <td class="toggle">
                        <label class="checkbox noMargin">
                            <input type="checkbox" name="checked[]" value="{PLUGIN_NAME}">
                            <span></span>
                        </label>
                    </td>
                    <td><strong>{PLUGIN_NAME}</strong></td>
                    <td>
                        <em>{PLUGIN_DESCRIPTION}</em><br>
                        <span>
                            <span>{TR_VERSION} {PLUGIN_VERSION}</span> (Build {PLUGIN_BUILD})<br>
                            <a href="mailto:{PLUGIN_MAILTO}">{TR_BY} {PLUGIN_AUTHOR}</a> | <a href="{PLUGIN_SITE}" target="_blank">{TR_VISIT_PLUGIN_SITE}</a>
                        </span>
                    </td>
                    <td>
                        <strong>{PLUGIN_STATUS}</strong>
                        <!-- BDP: plugin_status_details_block -->
                        <div id="{PLUGIN_NAME}" class="plugin_error" title="{TR_CLICK_FOR_MORE_DETAILS}">{PLUGIN_STATUS_DETAILS}</div>
                        <!-- EDP: plugin_status_details_block -->
                    </td>
                    <td>
                        <!-- BDP: plugin_activate_link -->
                        <a href="settings_plugins.php?{ACTIVATE_ACTION}={PLUGIN_NAME}" title="{TR_ACTIVATE_TOOLTIP}"></a>
                        <a href="settings_plugins.php?{UNINSTALL_ACTION}={PLUGIN_NAME}" title="{TR_UNINSTALL_TOOLTIP}"></a>
                        <!-- EDP: plugin_activate_link -->
                        <!-- BDP: plugin_deactivate_link -->
                        <a href="settings_plugins.php?disable={PLUGIN_NAME}" title="{TR_DEACTIVATE_TOOLTIP}"></a>
                        <a href="settings_plugins.php?protect={PLUGIN_NAME}" title="{TR_PROTECT_TOOLTIP}"></a>
                        <!-- EDP: plugin_deactivate_link -->
                        <!-- BDP: plugin_protected_link -->
                        <span title="{TR_UNPROTECT_TOOLTIP}">&nbsp;</span>
                        <!-- EDP: plugin_protected_link -->
                    </td>
                </tr>
                <!-- EDP: plugin_block -->
            </tbody>
        </table>
        <footer class="align-right">
            <div class="form-select sm">
                <select name="bulk_actions" id="bulk_actions">
                    <option value="noaction" selected>{TR_BULK_ACTIONS}</option>
                    <option value="install">{TR_INSTALL}</option>
                    <option value="enable">{TR_ACTIVATE}</option>
                    <option value="disable">{TR_DEACTIVATE}</option>
                    <option value="uninstall">{TR_UNINSTALL}</option>
                    <option value="protect">{TR_PROTECT}</option>
                    <option value="delete">{TR_DELETE}</option>
                </select>
            </div>
            <button class="btn sm" type="submit" name="Submit" id="bulk_actions_submit" disabled>{TR_APPLY}</button>
        </footer>
    </div>
</form>
<!-- EDP: plugins_block -->

<a href="settings_plugins.php?update_plugin_list=1" class="btn">{TR_UPDATE_PLUGIN_LIST}</a>

<form name="plugin_upload_frm" action="settings_plugins.php" method="post" enctype="multipart/form-data">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_PLUGIN_UPLOAD}</h3>
        </header>
        <section>
            <div class="form-element">
                <label>
                    {TR_PLUGIN_ARCHIVE}
                    <span class="tooltip-circle" data-tooltip="{TR_PLUGIN_ARCHIVE_TOOLTIP}">
                        <i data-eva="question-mark-circle"></i>
                    </span>
                </label>
                <input class="form-field" type="file" name="plugin_archive">
            </div>
            <div class="form-element full-width">
                <div class="action">
                    <button class="btn" type="submit">
                        {TR_UPLOAD}
                    </button>
                </div>
            </div>
        </section>
    </div>
</form>
