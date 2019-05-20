<div class="table sectionBox">
    <header>
        <h3>{TR_TITLE}</h3>
    </header>
    <div>
        <table>
            <thead>
                <th>{TR_USERNAME}</th>
                <th>{TR_LOGIN_ON}</th>
                <th></th>
            </thead>
            <tbody>
                <!-- BDP: user_session -->
                <tr>
                    <td data-th="{TR_USERNAME}">{ADMIN_USERNAME}</td>
                    <td data-th="{TR_LOGIN_ON}">{LOGIN_TIME}</td>
                    <td>
                        <div class="action-column">
                            <a class="btn sm muted" href="{DISCONNECT_LINK}">{TR_DISCONNECT}</a>
                            <a class="btn sm" href="{KILL_LINK}">{TR_KILL}</a>
                        </div>
                    </td>
                </tr>
                <!-- EDP: user_session -->
            </tbody>
        </table>
    </div>
</div>
