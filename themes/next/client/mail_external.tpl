<div class="message static_info">{TR_INTRO}</div>

<div class="sectionBox dataTable-static table">
    <header>
        <h3>{TR_TITLE}</h3>
    </header>
    <table>
        <thead>
            <th>{TR_DOMAIN}</th>
            <th>{TR_STATUS}</th>
            <th></th>
        </thead>
        <tbody>
            <!-- BDP: item -->
            <tr>
                <td data-th="{TR_DOMAIN}">{DOMAIN}</td>
                <td data-th="{TR_STATUS}">{STATUS}</td>
                <td>
                    <div class="action-column">
                        <!-- BDP: activate_link -->
                        <a href="?action=activate&domain_id={DOMAIN_ID}&domain_type={DOMAIN_TYPE}" class="btn sm">{TR_ACTIVATE}</a>
                        <!-- EDP: activate_link -->
                        <!-- BDP: deactivate_link -->
                        <a href="?action=deactivate&domain_id={DOMAIN_ID}&domain_type={DOMAIN_TYPE}" class="btn sm">{TR_DEACTIVATE}</a>
                        <!-- EDP: deactivate_link -->
                    </div>
                </td>
            </tr>
            <!-- EDP: item -->
        </tbody>
    </table>
</div>
