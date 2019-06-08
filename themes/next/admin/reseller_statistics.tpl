<div class="table dataTable-static sectionBox">
    <header>
        <h3>{TR_TITLE}</h3>
    </header>
    <table>
        <thead>
            <tr>
                <th>{TR_RESELLER_NAME}</th>
                <th>{TR_DISK_USAGE}</th>
                <th>{TR_TRAFFIC_USAGE}</th>
                <th>{TR_DOMAINS}</th>
                <th>{TR_SUBDOMAINS}</th>
                <th>{TR_DOMAIN_ALIASES}</th>
                <th>{TR_MAIL_ACCOUNTS}</th>
                <th>{TR_FTP_ACCOUNTS}</th>
                <th>{TR_SQL_DATABASES}</th>
                <th>{TR_SQL_USERS}</th>
            </tr>
        </thead>
        <tbody>
            <!-- BDP: reseller_statistics_block -->
            <tr>
                <td data-th="{TR_RESELLER_NAME}">
                    <a href="reseller_user_statistics.php?reseller_id={RESELLER_ID}" title="{TR_DETAILED_STATS_TOOLTIPS}" class="icon i_domain_icon">{RESELLER_NAME}</a>
                </td>
                <td data-th="{TR_DISK_USAGE}">
                    <div class="stats-graph">
                        <strong>{DISK_PERCENT}%</strong>
                        <div>
                            <span style="width:{DISK_PERCENT_WIDTH}%"></span>
                        </div>
                    </div>
                    {DISK_MSG}
                </td>
                <td data-th="{TR_TRAFFIC_USAGE}">
                    <div class="stats-graph">
                        <strong>{TRAFFIC_PERCENT}%</strong>
                        <div>
                            <span style="width:{TRAFFIC_PERCENT_WIDTH}%"></span>
                        </div>
                    </div>
                    {TRAFFIC_MSG}
                </td>
                <td data-th="{TR_DOMAINS}">{DMN_MSG}</td>
                <td data-th="{TR_SUBDOMAINS}">{SUB_MSG}</td>
                <td data-th="{TR_DOMAIN_ALIASES}">{ALS_MSG}</td>
                <td data-th="{TR_MAIL_ACCOUNTS}">{MAIL_MSG}</td>
                <td data-th="{TR_FTP_ACCOUNTS}">{FTP_MSG}</td>
                <td data-th="{TR_SQL_DATABASES}">{SQL_DB_MSG}</td>
                <td data-th="{TR_SQL_USERS}">{SQL_USER_MSG}</td>
            </tr>
            <!-- EDP: reseller_statistics_block -->
        </tbody>
    </table>
</div>
