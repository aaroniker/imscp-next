<div class="table sectionBox">
    <header>
        <h3>{TR_TITLE}</h3>
        <button class="btn sm" type="button" onclick="window.location.href = window.location.href.replace(/[\?#].*|$/, '?refresh');">
            {TR_FORCE_REFRESH}
        </button>
    </header>
    <div>
        <table>
            <thead>
                <th>{TR_SERVICE}</th>
                <th>{TR_IP}</th>
                <th>{TR_PORT}</th>
                <th>{TR_STATUS}</th>
            </thead>
            <tbody>
                <!-- BDP: service_status -->
                <tr>
                    <td data-th="{TR_SERVICE}">{SERVICE}</td>
                    <td data-th="{TR_IP}">{IP}</td>
                    <td data-th="{TR_PORT}">{PORT}</td>
                    <td data-th="{TR_SERVICE}" class="{CLASS}">
                        <span data-tooltip="{STATUS_TOOLTIP}">
                            <strong>{STATUS}</strong>
                        </span>
                    </td>
                </tr>
                <!-- EDP: service_status -->
            </tbody>
        </table>
    </div>
</div>
