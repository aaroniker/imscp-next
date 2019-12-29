<script>
    $(function() {

        $.extend($.fn.dataTableExt.oStdClasses, {
            'sFilterInput': 'form-field sm'
        });

        $('.table > table').dataTable({
            language: imscp_i18n.core.dataTable,
            displayLength: 10,
            processing: true,
            serverSide: true,
            pagingType: 'simple',
            ajaxSource: 'alias.php?action=get_table',
            stateSave: true,
            order: [0, 'desc'],
            dom: '<"dataTable"<"toolbar"lf><t><"paginate"ip>>',
            language: {
                paginate: {
                    previous: '<i data-eva="chevron-left"></i>' + imscp_i18n.core.dataTable.paginate.previous,
                    next: imscp_i18n.core.dataTable.paginate.next + '<i data-eva="chevron-right"></i>'
                }
            },
            columns: [
                {
                    data: "alias_name"
                },
                {
                    data: "alias_mount"
                },
                {
                    data: "url_forward"
                },
                {
                    data: "admin_name"
                },
                {
                    data: "alias_status"
                },
                {
                    data: "actions"
                }
            ],
            serverData(source, data, callback) {
                $.ajax({
                    dataType: 'json',
                    type: 'GET',
                    url: source,
                    data: data,
                    success: callback,
                    timeout: 3000
                }).fail(jqXHR => {
                    dataTable.fnProcessingIndicator(false);
                });
            },
            drawCallback() {
                let that = this[0],
                    toolbar = $(that.parentNode.previousSibling),
                    paginate = $(that.parentNode.nextSibling),
                    table = $(that);
                toolbar.find('.dataTables_length > label > select').wrap($('<div />').addClass('form-select sm'));
                table.find('strong').removeAttr('style');
                eva.replace({
                    fill: 'currentColor'
                });
                let titles = [],
                    c = 0;
                table.children('thead').children('tr').children('th').each(function() {
                    titles[c] = $(this).text();
                    c++;
                });
                table.children('tbody').children('tr').children('td').each(function() {
                    $(this).attr('data-th', titles[$(this).index()]);
                });
            }
        });

        function delete_alias(link, name) {
            return jQuery.imscp.confirmOnclick(link, sprintf("{TR_MESSAGE_DELETE_ALIAS}", name));
        }

        function delete_alias_order(link, name) {
            return jQuery.imscp.confirmOnclick(link, sprintf("{TR_MESSAGE_DELETE_ALIAS_ORDER}", name));
        }

    });
</script>

<div class="table sectionBox">
    <header>
        <h3>{TR_TITLE}</h3>
    </header>
    <table class="th-small">
        <thead>
            <tr>
                <th>{TR_ALIAS_NAME}</th>
                <th>{TR_MOUNT_POINT}</th>
                <th>{TR_FORWARD_URL}</th>
                <th>{TR_CUSTOMER}</th>
                <th>{TR_STATUS}</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="6">{TR_PROCESSING_DATA}</td>
            </tr>
        </tbody>
    </table>
</div>

<!-- BDP: als_add_button -->
<a class="btn" href="alias_add.php">{TR_ADD_DOMAIN_ALIAS}</a>
<!-- EDP: als_add_button -->
