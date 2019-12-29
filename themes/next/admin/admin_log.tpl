
<script>
    $(function() {

        let dataTable,
            messageContainer = $('#messageContainer');

        function setMessage(type, message) {
            $('<div>', {
                class: 'message ' + type,
                html: $.parseHTML(message)
            }).prependTo('#messageContainer');
            messageContainer.removeClass('hide');
        }

        $.fn.dataTableExt.oApi.fnProcessingIndicator = function(settings, onoff) {
            if(typeof(onoff) == 'undefined') {
                onoff = true;
            }
            this.oApi._fnProcessingDisplay(settings, onoff);
        };

        $.extend($.fn.dataTableExt.oStdClasses, {
            'sFilterInput': 'form-field sm'
        });

        dataTable = $('.table > table').dataTable({
            language: imscp_i18n.core.dataTable,
            displayLength: parseInt({ROWS_PER_PAGE}),
            processing: true,
            serverSide: true,
            pagingType: 'simple',
            dom: '<"dataTable"<"toolbar"lf><t><"paginate"ip>>',
            ajaxSource: '/admin/admin_log.php?action=get_logs',
            stateSave: true,
            order: [0, 'desc'],
            pagingType: 'simple',
            language: {
                paginate: {
                    previous: '<i data-eva="chevron-left"></i>' + imscp_i18n.core.dataTable.paginate.previous,
                    next: imscp_i18n.core.dataTable.paginate.next + '<i data-eva="chevron-right"></i>'
                }
            },
            columns: [
                {
                    data: 'log_time'
                },
                {
                    data: 'log_message'
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
                    setMessage('error', $.parseJSON(jqXHR.responseText).message);
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
                $('#clear_log').toggle(!(dataTable.fnSettings().fnRecordsTotal() < 2));
            }
        });

        $('#clear_log_frm').submit(function(e) {
            e.preventDefault();
            let data = $(this).serialize();
            $.ajax({
                dataType: 'json',
                type: 'POST',
                url: '/admin/admin_log.php?action=clear_logs',
                data: data,
                timeout: 3000
            }).done(data => {
                setMessage('success', data.message);
                dataTable.fnDraw();
            });
        });

        $(document).ajaxStart(e => {
            dataTable.fnProcessingIndicator();
        }).ajaxStop(e => {
            dataTable.fnProcessingIndicator(false);
        }).ajaxError((e, jqXHR, settings, exception) => {
            if(jqXHR.status == 403) {
                window.location.replace('/index.php');
            } else if(jqXHR.responseJSON !== 'undefined') {
                setMessage('error', jqXHR.responseJSON.message);
            } else if(exception == 'timeout') {
                setMessage('error', {TR_TIMEOUT_ERROR});
            } else {
                setMessage('error', {TR_UNEXPECTED_ERROR});
            }
        });

    });
</script>

<div class="message-container hide" id="messageContainer"></div>

<div class="table sectionBox">
    <header>
        <h3>{TR_TITLE}</h3>
    </header>
    <table class="th-small">
        <thead>
            <tr>
                <th>{TR_DATE}</th>
                <th>{TR_MESSAGE}</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="2">{TR_LOADING_DATA}</td>
            </tr>
        </tbody>
    </table>
    <footer id="clear_log">
        <form name="clear_log_frm" id="clear_log_frm">
            <div>
                <label for="uaction_clear">
                    <span>{TR_CLEAR_LOG_MESSAGE}</span>
                    <div class="form-select sm">
                        <select name="uaction_clear" id="uaction_clear">
                            <option value="0">{TR_CLEAR_LOG_EVERYTHING}</option>
                            <option value="2">{TR_CLEAR_LOG_LAST2}</option>
                            <option value="4">{TR_CLEAR_LOG_LAST4}</option>
                            <option value="12">{TR_CLEAR_LOG_LAST12}</option>
                            <option value="26">{TR_CLEAR_LOG_LAST26}</option>
                            <option value="52">{TR_CLEAR_LOG_LAST52}</option>
                        </select>
                    </div>
                </label>
                <button class="btn sm" name="Submit" type="submit">
                    {TR_CLEAR_LOG}
                </button>
            </div>
        </form>
    </footer>
</div>
