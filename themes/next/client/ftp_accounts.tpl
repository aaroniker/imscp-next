
<!-- BDP: ftp_accounts -->
<script>
    $(function() {
        $('.delete-confirm').on('click', function () {
            return jQuery.imscp.confirmOnclick(this, sprintf(imscp_i18n.core.deletion_confirm_msg, $(this).data('userid')));
        });
    })
</script>
<div class="table dataTable-static sectionBox">
    <header>
        <h3>{TR_TITLE}</h3>
    </header>
    <table>
        <thead>
            <tr>
                <th>{TR_FTP_ACCOUNT}</th>
                <th>{TR_FTP_ACCOUNT_STATUS}</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <!-- BDP: ftp_item -->
            <tr>
                <td class="strong">{FTP_ACCOUNT}</td>
                <td>{FTP_ACCOUNT_STATUS}</td>
                <td>
                    <!-- BDP: ftp_actions -->
                    <div class="action-column">
                        <a class="btn sm" href="ftp_edit.php?id={UID}">{TR_EDIT}</a>
                        <div ref="dropdown" class="dropdown">
                            <span>
                                <i></i>
                            </span>
                            <ul>
                                <li class="delete"><a class="delete-confirm" href="ftp_delete.php?id={UID}" data-userid="{UID}">{TR_DELETE}</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- EDP: ftp_actions -->
                </td>
            </tr>
            <!-- EDP: ftp_item -->
        </tbody>
    </table>
</div>
<!-- EDP: ftp_accounts -->
