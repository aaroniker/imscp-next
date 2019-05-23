
<script>
    $(function () {
        $.extend($.fn.dataTableExt.oStdClasses, {
            'sFilterInput': 'form-field sm'
        });
        let lang = JSON.parse(imscp_i18n.core.dataTable);
        dataTable = $('.dataTable > table').dataTable({
            language: imscp_i18n.core.dataTable,
            stateSave: true,
            columnDefs: [
                {
                    type: "natural",
                    targets: [1]
                }
            ],
            dom: '<"dataTable"<"toolbar"lf><t><"paginate"ip>>',
            pagingType: 'simple',
            language: {
                paginate: {
                    previous: '<i data-eva="chevron-left"></i>' + lang.paginate.previous,
                    next: lang.paginate.next + '<i data-eva="chevron-right"></i>'
                }
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
    });
</script>

<h2>{TR_SYSTEM_INFO}</h2>

<div id="overview-stats" class="large">
    <div class="box">
        <strong>{KERNEL}</strong>
        <span>{TR_KERNEL}</span>
    </div>
    <div class="box">
        <strong>{UPTIME}</strong>
        <span>{TR_UPTIME}</span>
    </div>
    <div class="box">
        <strong>{LOAD}</strong>
        <span>{TR_LOAD}</span>
    </div>
</div>

<div class="table sectionBox">
    <header>
        <h3>{TR_CPU_INFO}</h3>
    </header>
    <table>
        <tbody>
            <tr>
                <th>{TR_CPU_MODEL}</th>
                <td>{CPU_MODEL}</td>
            </tr>
            <tr>
                <th>{TR_CPU_CORES}</th>
                <td>{CPU_CORES}</td>
            </tr>
            <tr>
                <th>{TR_CPU_CLOCK_SPEED}</th>
                <td>{CPU_CLOCK_SPEED}</td>
            </tr>
            <tr>
                <th>{TR_CPU_CACHE}</th>
                <td>{CPU_CACHE}</td>
            </tr>
            <tr>
                <th>{TR_CPU_BOGOMIPS}</th>
                <td>{CPU_BOGOMIPS}</td>
            </tr>
        </tbody>
    </table>
</div>

<div class="table sectionBox">
    <header>
        <h3>{TR_RAM}</h3>
    </header>
    <table>
        <tbody>
            <tr>
                <th>{TR_TOTAL}</th>
                <td>{RAM_TOTAL}</td>
            </tr>
            <tr>
                <th>{TR_USED}</th>
                <td>{RAM_USED}</td>
            </tr>
            <tr>
                <th>{TR_FREE}</th>
                <td>{RAM_FREE}</td>
            </tr>
        </tbody>
    </table>
    <header>
        <h3>{TR_SWAP}</h3>
    </header>
    <table>
        <tbody>
            <tr>
                <th>{TR_TOTAL}</th>
                <td>{SWAP_TOTAL}</td>
            </tr>
            <tr>
                <th>{TR_USED}</th>
                <td>{SWAP_USED}</td>
            </tr>
            <tr>
                <th>{TR_FREE}</th>
                <td>{SWAP_FREE}</td>
            </tr>
        </tbody>
    </table>
</div>

<div class="table dataTable sectionBox">
    <header>
        <h3>{TR_FILE_SYSTEM_INFO}</h3>
    </header>
    <table>
        <thead>
            <tr>
                <th>{TR_MOUNT}</th>
                <th>{TR_TYPE}</th>
                <th>{TR_PARTITION}</th>
                <th>{TR_PERCENT}</th>
                <th>{TR_FREE}</th>
                <th>{TR_USED}</th>
                <th>{TR_SIZE}</th>
            </tr>
        </thead>
        <tbody>
            <!-- BDP: device_block -->
            <tr>
                <td>{MOUNT}</td>
                <td>{TYPE}</td>
                <td>{PARTITION}</td>
                <td>{PERCENT}%</td>
                <td>{FREE}</td>
                <td>{USED}</td>
                <td>{SIZE}</td>
            </tr>
            <!-- EDP: device_block -->
        </tbody>
    </table>
</div>
