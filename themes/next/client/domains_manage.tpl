<script>
    function action_delete(link, recordType) {
        if(link.href == '#') return false;
        var msg;
        switch(recordType) {
            case 'als':
            msg = imscp_i18n.core.als_delete_alert;
            break;
            case 'sub':
            msg = imscp_i18n.core.sub_delete_alert;
            break;
            default:
            msg = imscp_i18n.core.dns_delete_alert;
        }
        return jQuery.imscp.confirmOnclick(link, msg);
    }
</script>

<!-- BDP: domain_list -->
<div class="table dataTable-static sectionBox">
    <header>
        <h3>{TR_DOMAINS}</h3>
    </header>
    <table class="domains">
        <thead>
            <tr>
                <th>{TR_NAME}</th>
                <th>{TR_MOUNT_POINT}</th>
                <th>{TR_DOCUMENT_ROOT}</th>
                <th>{TR_REDIRECT}</th>
                <th>{TR_STATUS}</th>
                <th>{TR_SSL_STATUS}</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <!-- BDP: domain_item -->
            <tr>
                <!-- BDP: domain_status_reload_true -->
                <td>
                    <a href="http://{DOMAIN_NAME}" target="_blank">{DOMAIN_NAME}</a>
                    <!-- BDP: dmn_alt_url -->
                    <a href="http://{ALTERNATE_URL}" class="icon-alternative" target="_blank" data-tooltip="{ALTERNATE_URL_TOOLTIP}">
                        <i data-eva="link-2"></i>
                    </a>
                    <!-- EDP: dmn_alt_url -->
                </td>
                <!-- EDP: domain_status_reload_true -->
                <!-- BDP: domain_status_reload_false -->
                <td>
                    <span data-tooltip="{DOMAIN_NAME}">{DOMAIN_NAME}</span>
                </td>
                <!-- EDP: domain_status_reload_false -->
                <td>{DOMAIN_MOUNT_POINT}</td>
                <td>{DOMAIN_DOCUMENT_ROOT}</td>
                <td>{DOMAIN_REDIRECT}</td>
                <td>{DOMAIN_STATUS}</td>
                <td>{DOMAIN_SSL_STATUS}</td>
                <td>
                    <div class="action-column">
                        <a class="btn sm" href="{DOMAIN_EDIT_LINK}">{DOMAIN_EDIT}</a>
                        <div ref="dropdown" class="dropdown">
                            <span>
                                <i></i>
                            </span>
                            <ul>
                                <li><a href="{CERT_SCRIPT}">{VIEW_CERT}</a></li>
                            </ul>
                        </div>
                    </div>
                </td>
            </tr>
            <!-- EDP: domain_item -->
        </tbody>
    </table>
</div>
<!-- EDP: domains_list -->

<!-- BDP: domain_aliases_block -->

<!-- BDP: als_list -->
<div class="table dataTable-static sectionBox">
    <header>
        <h3>{TR_DOMAIN_ALIASES}</h3>
    </header>
    <table class="domains">
        <thead>
            <tr>
                <th>{TR_NAME}</th>
                <th>{TR_MOUNT_POINT}</th>
                <th>{TR_DOCUMENT_ROOT}</th>
                <th>{TR_REDIRECT}</th>
                <th>{TR_STATUS}</th>
                <th>{TR_SSL_STATUS}</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <!-- BDP: als_item -->
            <tr>
                <!-- BDP: als_status_reload_true -->
                <td>
                    <a href="http://{ALS_NAME}/" target="_blank">{ALS_NAME}</a>
                    <!-- BDP: als_alt_url -->
                    <a href="http://{ALTERNATE_URL}" class="icon-alternative" target="_blank" data-tooltip="{ALTERNATE_URL_TOOLTIP}">
                        <i data-eva="link-2"></i>
                    </a>
                    <!-- EDP: als_alt_url -->
                </td>
                <!-- EDP: als_status_reload_true -->
                <!-- BDP: als_status_reload_false -->
                <td>
                    <span data-tooltip="{ALS_NAME}">{ALS_NAME}</span>
                </td>
                <!-- EDP: als_status_reload_false -->
                <td>{ALS_MOUNT_POINT}</td>
                <td>{ALS_DOCUMENT_ROOT}</td>
                <td>{ALS_REDIRECT}</td>
                <td>{ALS_STATUS}</td>
                <td>{ALS_SSL_STATUS}</td>
                <td>
                    <div class="action-column">
                        <a class="btn sm" href="{ALS_EDIT_LINK}">{ALS_EDIT}</a>
                        <div ref="dropdown" class="dropdown">
                            <span>
                                <i></i>
                            </span>
                            <ul>
                                <li><a href="{CERT_SCRIPT}">{VIEW_CERT}</a></li>
                                <li class="delete"><a href="{ALS_ACTION_SCRIPT}" onclick="return action_delete(this, 'als');">{ALS_ACTION}</a></li>
                            </ul>
                        </div>
                    </div>
                </td>
            </tr>
            <!-- EDP: als_item -->
            <!-- BDP: als_message -->
            <tr>
                <td colspan="7">
                    <div class="message info">{ALS_MSG}</div>
                </td>
            </tr>
            <!-- EDP: als_message -->
        </tbody>
    </table>
</div>
<!-- EDP: als_list -->

<!-- EDP: domain_aliases_block -->

<!-- BDP: subdomains_block -->

<!-- BDP: sub_list -->
<div class="table dataTable-static sectionBox">
    <header>
        <h3>{TR_SUBDOMAINS}</h3>
    </header>
    <table class="domains">
        <thead>
            <tr>
                <th>{TR_NAME}</th>
                <th>{TR_MOUNT_POINT}</th>
                <th>{TR_DOCUMENT_ROOT}</th>
                <th>{TR_REDIRECT}</th>
                <th>{TR_STATUS}</th>
                <th>{TR_SSL_STATUS}</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <!-- BDP: sub_item -->
            <tr>
                <!-- BDP: sub_status_reload_true -->
                <td>
                    <a href="http://{SUB_NAME}.{SUB_ALIAS_NAME}" target="_blank">{SUB_NAME}.{SUB_ALIAS_NAME}</a>
                    <!-- BDP: sub_alt_url -->
                    <a href="http://{ALTERNATE_URL}" class="icon-alternative" target="_blank" data-tooltip="{ALTERNATE_URL_TOOLTIP}">
                        <i data-eva="link-2"></i>
                    </a>
                    <!-- EDP: sub_alt_url -->
                </td>
                <!-- EDP: sub_status_reload_true -->
                <!-- BDP: sub_status_reload_false -->
                <td><span data-tooltip="{SUB_NAME}.{SUB_ALIAS_NAME}">{SUB_NAME}.{SUB_ALIAS_NAME}</span></td>
                <!-- EDP: sub_status_reload_false -->
                <td>{SUB_MOUNT_POINT}</td>
                <td>{SUB_DOCUMENT_ROOT}</td>
                <td>{SUB_REDIRECT}</td>
                <td>{SUB_STATUS}</td>
                <td>{SUB_SSL_STATUS}</td>
                <td>
                    <div class="action-column">
                        <a class="btn sm" href="{SUB_EDIT_LINK}">{SUB_EDIT}</a>
                        <div ref="dropdown" class="dropdown">
                            <span>
                                <i></i>
                            </span>
                            <ul>
                                <li><a href="{CERT_SCRIPT}">{VIEW_CERT}</a></li>
                                <li class="delete"><a href="{SUB_ACTION_SCRIPT}" onclick="return action_delete(this, 'sub');">{SUB_ACTION}</a></li>
                            </ul>
                        </div>
                    </div>
                </td>
            </tr>
            <!-- EDP: sub_item -->
            <!-- BDP: sub_message -->
            <tr>
                <td colspan="7">
                    <div class="message info">{SUB_MSG}</div>
                </td>
            </tr>
            <!-- EDP: sub_message -->
        </tbody>
    </table>
</div>
<!-- EDP: sub_list -->

<!-- EDP: subdomains_block -->

<!-- BDP: custom_dns_records_block -->

<!-- BDP: dns_list -->
<div class="table dataTable-static sectionBox">
    <header>
        <h3>{TR_DNS}</h3>
    </header>
    <table class="domains">
        <thead>
            <tr>
                <th>{TR_ZONE}</th>
                <th>{TR_DNS_NAME}</th>
                <th>{TR_TTL}</th>
                <th>{TR_DNS_CLASS}</th>
                <th>{TR_DNS_TYPE}</th>
                <th>{TR_DNS_DATA}</th>
                <th>{TR_DNS_STATUS}</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <!-- BDP: dns_item -->
            <tr>
                <td><span>{DNS_DOMAIN}</span></td>
                <td>{DNS_NAME}</td>
                <td>{DNS_TTL}</td>
                <td>{DNS_CLASS}</td>
                <td>{DNS_TYPE}</td>
                <td><span data-tooltip="{LONG_DNS_DATA}">{SHORT_DNS_DATA}</span></td>
                <td><span data-tooltip="{LONG_DNS_STATUS}">{SHORT_DNS_STATUS}</span></td>
                <td>
                    <div class="action-column">
                        <!-- BDP: dns_edit_link -->
                        <a class="btn sm" href="{DNS_ACTION_SCRIPT_EDIT}">{DNS_ACTION_EDIT}</a>
                        <!-- EDP: dns_edit_link -->
                        <!-- BDP: dns_delete_link -->
                        <div ref="dropdown" class="dropdown">
                            <span>
                                <i></i>
                            </span>
                            <ul>
                                <li class="delete"><a href="{DNS_ACTION_SCRIPT_DELETE}" onclick="return action_delete(this, 'dns');">{DNS_ACTION_DELETE}</a></li>
                            </ul>
                        </div>
                        <!-- EDP: dns_delete_link -->
                    </div>
                </td>
            </tr>
            <!-- EDP: dns_item -->
            <!-- BDP: dns_message -->
            <tr>
                <td colspan="8">
                    <div class="message info">{DNS_MSG}</div>
                </td>
            </tr>
            <!-- EDP: dns_message -->
        </tbody>
    </table>
</div>
<!-- EDP: dns_list -->

<!-- EDP: custom_dns_records_block -->
