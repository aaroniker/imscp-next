<h2>{TR_PENDING_TASKS} ({EXEC_COUNT})</h2>
<a href="imscp_debugger.php?action=run" class="btn">{TR_EXEC_TASKS}</a>

<div class="table sectionBox">
    <header>
        <h3>{TR_USER_ERRORS}</h3>
    </header>
    <table>
        <tbody>
            <!-- BDP: user_message -->
            <tr>
                <td colspan="2">
                    <div class="message info">{TR_USER_MESSAGE}</div>
                </td>
            </tr>
            <!-- EDP: user_message -->
            <!-- BDP: user_item -->
            <tr>
                <td>
                    <strong>{USER_NAME}</strong><br>
                    {USER_ERROR}
                </td>
                <td>
                    <div class="action-column">
                        <a href="imscp_debugger.php?action=change&amp;id={CHANGE_ID}&amp;type={CHANGE_TYPE}" class="btn sm">{TR_CHANGE_STATUS}</a>
                    </div>
                </td>
            </tr>
            <!-- EDP: user_item -->
        </tbody>
    </table>
    <header>
        <h3>{TR_DMN_ERRORS}</h3>
    </header>
    <table>
        <tbody>
            <!-- BDP: dmn_message -->
            <tr>
                <td colspan="2">
                    <div class="message info">{TR_DMN_MESSAGE}</div>
                </td>
            </tr>
            <!-- EDP: dmn_message -->
            <!-- BDP: dmn_item -->
            <tr>
                <td>
                    <strong>{DMN_NAME}</strong><br>
                    {DMN_ERROR}
                </td>
                <td>
                    <div class="action-column">
                        <a href="imscp_debugger.php?action=change&amp;id={CHANGE_ID}&amp;type={CHANGE_TYPE}" class="btn sm">{TR_CHANGE_STATUS}</a>
                    </div>
                </td>
            </tr>
            <!-- EDP: dmn_item -->
        </tbody>
    </table>
    <header>
        <h3>{TR_ALS_ERRORS}</h3>
    </header>
    <table>
        <tbody>
            <!-- BDP: als_message -->
            <tr>
                <td colspan="2">
                    <div class="message info">{TR_ALS_MESSAGE}</div>
                </td>
            </tr>
            <!-- EDP: als_message -->
            <!-- BDP: als_item -->
            <tr>
                <td>
                    <strong>{ALS_NAME}</strong><br>
                    {ALS_ERROR}
                </td>
                <td>
                    <div class="action-column">
                        <a href="imscp_debugger.php?action=change&amp;id={CHANGE_ID}&amp;type={CHANGE_TYPE}" class="btn sm">{TR_CHANGE_STATUS}</a>
                    </div>
                </td>
            </tr>
            <!-- EDP: als_item -->
        </tbody>
    </table>
    <header>
        <h3>{TR_SUB_ERRORS}</h3>
    </header>
    <table>
        <tbody>
            <!-- BDP: sub_message -->
            <tr>
                <td colspan="2">
                    <div class="message info">{TR_SUB_MESSAGE}</div>
                </td>
            </tr>
            <!-- EDP: sub_message -->
            <!-- BDP: sub_item -->
            <tr>
                <td>
                    <strong>{SUB_NAME}</strong><br>
                    {SUB_ERROR}
                </td>
                <td>
                    <div class="action-column">
                        <a href="imscp_debugger.php?action=change&amp;id={CHANGE_ID}&amp;type={CHANGE_TYPE}" class="btn sm">{TR_CHANGE_STATUS}</a>
                    </div>
                </td>
            </tr>
            <!-- EDP: sub_item -->
        </tbody>
    </table>
    <header>
        <h3>{TR_ALSSUB_ERRORS}</h3>
    </header>
    <table>
        <tbody>
            <!-- BDP: alssub_message -->
            <tr>
                <td colspan="2">
                    <div class="message info">{TR_ALSSUB_MESSAGE}</div>
                </td>
            </tr>
            <!-- EDP: alssub_message -->
            <!-- BDP: alssub_item -->
            <tr>
                <td>
                    <strong>{ALSSUB_NAME}</strong><br>
                    {ALSSUB_ERROR}
                </td>
                <td>
                    <div class="action-column">
                        <a href="imscp_debugger.php?action=change&amp;id={CHANGE_ID}&amp;type={CHANGE_TYPE}" class="btn sm">{TR_CHANGE_STATUS}</a>
                    </div>
                </td>
            </tr>
            <!-- EDP: alssub_item -->
        </tbody>
    </table>
    <header>
        <h3>{TR_CUSTOM_DNS_ERRORS}</h3>
    </header>
    <table>
        <tbody>
            <!-- BDP: custom_dns_message -->
            <tr>
                <td colspan="2">
                    <div class="message info">{TR_CUSTOM_DNS_MESSAGE}</div>
                </td>
            </tr>
            <!-- EDP: custom_dns_message -->
            <!-- BDP: custom_dns_item -->
            <tr>
                <td>
                    <strong>{CUSTOM_DNS_NAME}</strong><br>
                    {CUSTOM_DNS_ERROR}
                </td>
                <td>
                    <div class="action-column">
                        <a href="imscp_debugger.php?action=change&amp;id={CHANGE_ID}&amp;type={CHANGE_TYPE}" class="btn sm">{TR_CHANGE_STATUS}</a>
                    </div>
                </td>
            </tr>
            <!-- EDP: custom_dns_item -->
        </tbody>
    </table>
    <header>
        <h3>{TR_HTACCESS_ERRORS}</h3>
    </header>
    <table>
        <tbody>
            <!-- BDP: htaccess_message -->
            <tr>
                <td colspan="2">
                    <div class="message info">{TR_HTACCESS_MESSAGE}</div>
                </td>
            </tr>
            <!-- EDP: htaccess_message -->
            <!-- BDP: htaccess_item -->
            <tr>
                <td>
                    <strong>{HTACCESS_NAME} ({HTACCESS_TYPE})</strong><br>
                    {HTACCESS_ERROR}
                </td>
                <td>
                    <div class="action-column">
                        <a href="imscp_debugger.php?action=change&amp;id={CHANGE_ID}&amp;type={CHANGE_TYPE}" class="btn sm">{TR_CHANGE_STATUS}</a>
                    </div>
                </td>
            </tr>
            <!-- EDP: htaccess_item -->
        </tbody>
    </table>
    <header>
        <h3>{TR_FTP_ERRORS}</h3>
    </header>
    <table>
        <tbody>
            <!-- BDP: ftp_message -->
            <tr>
                <td colspan="2">
                    <div class="message info">{TR_FTP_MESSAGE}</div>
                </td>
            </tr>
            <!-- EDP: ftp_message -->
            <!-- BDP: ftp_item -->
            <tr>
                <td>
                    <strong>{FTP_NAME}</strong><br>
                    {FTP_ERROR}
                </td>
                <td>
                    <div class="action-column">
                        <a href="imscp_debugger.php?action=change&amp;id={CHANGE_ID}&amp;type={CHANGE_TYPE}" class="btn sm">{TR_CHANGE_STATUS}</a>
                    </div>
                </td>
            </tr>
            <!-- EDP: ftp_item -->
        </tbody>
    </table>
    <header>
        <h3>{TR_MAIL_ERRORS}</h3>
    </header>
    <table>
        <tbody>
            <!-- BDP: mail_message -->
            <tr>
                <td colspan="2">
                    <div class="message info">{TR_MAIL_MESSAGE}</div>
                </td>
            </tr>
            <!-- EDP: mail_message -->
            <!-- BDP: mail_item -->
            <tr>
                <td>
                    <strong>{MAIL_NAME}</strong><br>
                    {MAIL_ERROR}
                </td>
                <td>
                    <div class="action-column">
                        <a href="imscp_debugger.php?action=change&amp;id={CHANGE_ID}&amp;type={CHANGE_TYPE}" class="btn sm">{TR_CHANGE_STATUS}</a>
                    </div>
                </td>
            </tr>
            <!-- EDP: mail_item -->
        </tbody>
    </table>
    <header>
        <h3>{TR_IP_ERRORS}</h3>
    </header>
    <table>
        <tbody>
            <!-- BDP: ip_message -->
            <tr>
                <td colspan="2">
                    <div class="message info">{TR_IP_MESSAGE}</div>
                </td>
            </tr>
            <!-- EDP: ip_message -->
            <!-- BDP: ip_item -->
            <tr>
                <td>
                    <strong>{IP_NAME}</strong><br>
                    {IP_ERROR}
                </td>
                <td>
                    <div class="action-column">
                        <a href="imscp_debugger.php?action=change&amp;id={CHANGE_ID}&amp;type={CHANGE_TYPE}" class="btn sm">{TR_CHANGE_STATUS}</a>
                    </div>
                </td>
            </tr>
            <!-- EDP: ip_item -->
        </tbody>
    </table>
    <header>
        <h3>{TR_PLUGIN_ITEM_ERRORS}</h3>
    </header>
    <table>
        <tbody>
            <!-- BDP: plugin_item_message -->
            <tr>
                <td colspan="2">
                    <div class="message info">{TR_PLUGIN_ITEM_MESSAGE}</div>
                </td>
            </tr>
            <!-- EDP: plugin_item_message -->
            <!-- BDP: plugin_item_item -->
            <tr>
                <td>
                    <strong>{PLUGIN_NAME}</strong><br>
                    {PLUGIN_ITEM_ERROR}
                </td>
                <td>
                    <div class="action-column">
                        <a href="imscp_debugger.php?action=change&amp;id={CHANGE_ID}&amp;type={CHANGE_TYPE}&amp;table={TABLE}&amp;field={FIELD}" class="btn sm">{TR_CHANGE_STATUS}</a>
                    </div>
                </td>
            </tr>
            <!-- EDP: plugin_item_item -->
        </tbody>
    </table>
</div>
