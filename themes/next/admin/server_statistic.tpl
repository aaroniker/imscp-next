<script>
    $(function() {
       $('#day, #month, #year').on('change', function() {
           $(this).closest("form").submit();
           return false;
       });
    });
</script>

<div class="table sectionBox">
    <header>
        <h3>{TR_TITLE}</h3>
    </header>
    <footer>
        <form>
            <div>
                <label>
                    <span>{TR_DAY}</span>
                    <div class="form-select sm">
                        <select name="day" id="day">
                            <!-- BDP: day_list -->
                            <option value="{VALUE}"{OPTION_SELECTED}>{HUMAN_VALUE}</option>
                            <!-- EDP: day_list -->
                        </select>
                    </div>
                </label>
                <label>
                    <span>{TR_MONTH}</span>
                    <div class="form-select sm">
                        <select name="month" id="month">
                            <!-- BDP: month_list -->
                            <option{OPTION_SELECTED}>{MONTH_VALUE}</option>
                            <!-- EDP: month_list -->
                        </select>
                    </div>
                </label>
                <label>
                    <span>{TR_YEAR}</span>
                    <div class="form-select sm">
                        <select name="year" id="year">
                            <!-- BDP: year_list -->
                            <option{OPTION_SELECTED}>{YEAR_VALUE}</option>
                            <!-- EDP: year_list -->
                        </select>
                    </div>
                </label>
            </div>
        </form>
    </footer>
    <!-- BDP: server_stats_by_month -->
    <table class="font-small th-medium">
        <thead>
            <tr>
                <th>{TR_DAY}</th>
                <th>WEB</th>
                <th>SMTP</th>
                <th>POP</th>
                <th>OTHER</th>
                <th>{TR_ALL}</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <!-- BDP: server_stats_day -->
            <tr>
                <td data-th="{TR_DAY}">{DAY}</td>
                <td data-th="WEB">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_WEB_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {WEB_IN}
                        </span>
                        <span data-tooltip="{TR_WEB_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {WEB_OUT}
                        </span>
                    </div>
                </td>
                <td data-th="SMTP">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_SMTP_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {SMTP_IN}
                        </span>
                        <span data-tooltip="{TR_SMTP_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {SMTP_OUT}
                        </span>
                    </div>
                </td>
                <td data-th="POP">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_POP_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {POP_IN}
                        </span>
                        <span data-tooltip="{TR_POP_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {POP_OUT}
                        </span>
                    </div>
                </td>
                <td data-th="OTHER">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_OTHER_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {OTHER_IN}
                        </span>
                        <span data-tooltip="{TR_OTHER_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {OTHER_OUT}
                        </span>
                    </div>
                </td>
                <td data-th="ALL">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_ALL_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {ALL_IN}
                        </span>
                        <span data-tooltip="{TR_ALL_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {ALL_OUT}
                        </span>
                    </div>
                </td>
                <td data-th>
                    <strong>{ALL}</strong>
                </td>
            </tr>
            <!-- EDP: server_stats_day -->
        </tbody>
        <tfoot>
            <tr>
                <td data-th="{TR_DAY}">{TR_ALL}</td>
                <td data-th="WEB">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_WEB_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {WEB_IN_ALL}
                        </span>
                        <span data-tooltip="{TR_WEB_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {WEB_OUT_ALL}
                        </span>
                    </div>
                </td>
                <td data-th="SMTP">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_SMTP_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {SMTP_IN_ALL}
                        </span>
                        <span data-tooltip="{TR_SMTP_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {SMTP_OUT_ALL}
                        </span>
                    </div>
                </td>
                <td data-th="POP">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_POP_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {POP_IN_ALL}
                        </span>
                        <span data-tooltip="{TR_POP_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {POP_OUT_ALL}
                        </span>
                    </div>
                </td>
                <td data-th="OTHER">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_OTHER_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {OTHER_IN_ALL}
                        </span>
                        <span data-tooltip="{TR_OTHER_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {OTHER_OUT_ALL}
                        </span>
                    </div>
                </td>
                <td data-th="{TR_ALL}">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_ALL_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {ALL_IN_ALL}
                        </span>
                        <span data-tooltip="{TR_ALL_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {ALL_OUT_ALL}
                        </span>
                    </div>
                </td>
                <td data-th>
                    <strong>{ALL_ALL}</strong>
                </td>
            </tr>
        </tfoot>
    </table>
    <!-- EDP: server_stats_by_month -->
    <!-- BDP: server_stats_by_day -->
    <table class="font-small th-medium">
        <thead>
            <tr>
                <th>{TR_HOUR}</th>
                <th>WEB</th>
                <th>SMTP</th>
                <th>POP</th>
                <th>OTHER</th>
                <th>{TR_ALL}</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <!-- BDP: server_stats_hour -->
            <tr>
                <td data-th="{TR_HOUR}">{HOUR}</td>
                <td data-th="WEB">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_WEB_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {WEB_IN}
                        </span>
                        <span data-tooltip="{TR_WEB_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {WEB_OUT}
                        </span>
                    </div>
                </td>
                <td data-th="SMTP">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_SMTP_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {SMTP_IN}
                        </span>
                        <span data-tooltip="{TR_SMTP_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {SMTP_OUT}
                        </span>
                    </div>
                </td>
                <td data-th="POP">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_POP_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {POP_IN}
                        </span>
                        <span data-tooltip="{TR_POP_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {POP_OUT}
                        </span>
                    </div>
                </td>
                <td data-th="OTHER">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_OTHER_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {OTHER_IN}
                        </span>
                        <span data-tooltip="{TR_OTHER_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {OTHER_OUT}
                        </span>
                    </div>
                </td>
                <td data-th="ALL">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_ALL_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {ALL_IN}
                        </span>
                        <span data-tooltip="{TR_ALL_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {ALL_OUT}
                        </span>
                    </div>
                </td>
                <td data-th>
                    <strong>{ALL}</strong>
                </td>
            </tr>
            <!-- EDP: server_stats_hour -->
        </tbody>
        <tfoot>
            <tr>
                <td data-th="{TR_HOUR}">{TR_ALL}</td>
                <td data-th="WEB">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_WEB_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {WEB_IN_ALL}
                        </span>
                        <span data-tooltip="{TR_WEB_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {WEB_OUT_ALL}
                        </span>
                    </div>
                </td>
                <td data-th="SMTP">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_SMTP_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {SMTP_IN_ALL}
                        </span>
                        <span data-tooltip="{TR_SMTP_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {SMTP_OUT_ALL}
                        </span>
                    </div>
                </td>
                <td data-th="POP">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_POP_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {POP_IN_ALL}
                        </span>
                        <span data-tooltip="{TR_POP_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {POP_OUT_ALL}
                        </span>
                    </div>
                </td>
                <td data-th="OTHER">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_OTHER_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {OTHER_IN_ALL}
                        </span>
                        <span data-tooltip="{TR_OTHER_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {OTHER_OUT_ALL}
                        </span>
                    </div>
                </td>
                <td data-th="{TR_ALL}">
                    <div class="stats-in-out">
                        <span data-tooltip="{TR_ALL_IN}">
                            <i data-eva="cloud-upload-outline"></i>
                            {ALL_IN_ALL}
                        </span>
                        <span data-tooltip="{TR_ALL_OUT}">
                            <i data-eva="cloud-download-outline"></i>
                            {ALL_OUT_ALL}
                        </span>
                    </div>
                </td>
                <td data-th>
                    <strong>{ALL_ALL}</strong>
                </td>
            </tr>
        </tfoot>
    </table>
    <!-- EDP: server_stats_by_day -->
</div>
