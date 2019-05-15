<div class="table sectionBox four-columns mobile-legend">
    <header>
        <h3>{TR_TITLE}</h3>
        <button class="btn sm" type="button" onclick="window.location.href = window.location.href.replace(/[\?#].*|$/, '?refresh');">
            {TR_FORCE_REFRESH}
        </button>
    </header>
    <div class="legend">
        <ul>
            <li>{TR_SERVICE}</li>
            <li>{TR_IP}</li>
            <li>{TR_PORT}</li>
            <li>{TR_STATUS}</li>
        </ul>
    </div>
    <ul>
        <!-- BDP: service_status -->
        <li>
            <div data-legend="{TR_SERVICE}">{SERVICE}</div>
            <div data-legend="{TR_IP}">{IP}</div>
            <div data-legend="{TR_PORT}">{PORT}</div>
            <div data-legend="{TR_STATUS}" class="{CLASS}">
                <span data-tooltip="{STATUS_TOOLTIP}">
                    <strong>{STATUS}</strong>
                </span>
            </div>
        </li>
        <!-- EDP: service_status -->
    </ul>
</div>
