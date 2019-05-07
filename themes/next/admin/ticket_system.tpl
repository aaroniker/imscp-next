
<script>
    function action_delete(link, subject) {
        if (subject == '#__all__#') {
            return jQuery.imscp.confirmOnclick(link, "{TR_TICKETS_DELETE_ALL_MESSAGE}");
        }

        return jQuery.imscp.confirmOnclick(link, sprintf("{TR_TICKETS_DELETE_MESSAGE}", subject));
    }
</script>
<!-- BDP: tickets_list -->
<table>
    <thead>
    <tr>
        <th>{TR_TICKET_STATUS}</th>
        <th>{TR_TICKET_FROM}</th>
        <th>{TR_TICKET_SUBJECT}</th>
        <th>{TR_TICKET_URGENCY}</th>
        <th>{TR_TICKET_LAST_ANSWER_DATE}</th>
        <th>{TR_TICKET_ACTIONS}</th>
    </tr>
    </thead>
    <tbody>
    <!-- BDP: tickets_item -->
    <tr>
        <td><strong>{TICKET_STATUS_VAL}</strong></td>
        <td>{TICKET_FROM_VAL}</td>
        <td>
            <a href="ticket_view.php?ticket_id={TICKET_ID_VAL}" class="icon i_document" title="{TR_TICKET_READ_LINK}">{TICKET_SUBJECT_VAL}</a>
        </td>
        <td>{TICKET_URGENCY_VAL}</td>
        <td>{TICKET_LAST_DATE_VAL}</td>
        <td>
            <a href="ticket_delete.php?ticket_id={TICKET_ID_VAL}" onclick="return action_delete(this, '{TICKET_SUBJECT2_VAL}')" class="icon i_delete" title="{TR_TICKET_DELETE_LINK}">{TR_TICKET_DELETE}</a>
            <a href="ticket_system.php?ticket_id={TICKET_ID_VAL}" class="icon i_close" title="{TR_TICKET_CLOSE_LINK}">{TR_TICKET_CLOSE}</a>
        </td>
    </tr>
    <!-- EDP: tickets_item -->
    <tr>
        <td colspan="6">
            <div class="buttons">
                <a class="link_as_button" href="ticket_delete.php?delete=open" onclick="return action_delete(this, '#__all__#')">{TR_TICKET_DELETE_ALL}</a>
            </div>
        </td>
    </tr>
    </tbody>
</table>
<div class="paginator">
    <!-- BDP: scroll_prev -->
    <a class="icon i_prev" href="ticket_system.php?psi={PREV_PSI}" title="{TR_PREVIOUS}">{TR_PREVIOUS}</a>
    <!-- EDP: scroll_prev -->
    <!-- BDP: scroll_prev_gray -->
    <span class="icon i_prev_gray"></span>
    <!-- EDP: scroll_prev_gray -->
    <!-- BDP: scroll_next_gray -->
    <span class="icon i_next_gray"></span>
    <!-- EDP: scroll_next_gray -->
    <!-- BDP: scroll_next -->
    <a class="icon i_next" href="ticket_system.php?psi={NEXT_PSI}" title="{TR_NEXT}">{TR_NEXT}</a>
    <!-- EDP: scroll_next -->
</div>
<!-- EDP: tickets_list -->
