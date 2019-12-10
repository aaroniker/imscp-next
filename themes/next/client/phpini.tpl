
<script>
    $(function () {
        $('#domain_id').on('change', function() {
            window.location.href = '?' + $.param({
                domain_id: $(this).val(),
                domain_type: $(this).find('option:selected').data('domain-type')
            });
        });
    });
</script>

<form name="editFrm" method="post" action="phpini.php">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_PHP_SETTINGS}</h3>
        </header>
        <section>
            <!-- BDP: domain_list_block -->
            <div class="form-element">
                <label for="domain_id">
                    {TR_DOMAIN}
                    <span class="tooltip-circle" data-tooltip="{TR_DOMAIN_TOOLTIP}">
                        <i data-eva="question-mark-circle"></i>
                    </span>
                </label>
                <div class="form-select">
                    <select name="domain_id" id="domain_id">
                        <!-- BDP: domain_name_block -->
                        <option value="{DOMAIN_ID}" data-domain-type="{DOMAIN_TYPE}"{SELECTED}>{DOMAIN_NAME_UNICODE}</option>
                        <!-- EDP: domain_name_block -->
                    </select>
                    <input type="hidden" name="domain_type" value="{DOMAIN_TYPE}">
                </div>
            </div>
            <!-- EDP: domain_list_block -->
            <!-- BDP: allow_url_fopen_block -->
            <div class="form-element">
                <label for="allow_url_fopen">{TR_ALLOW_URL_FOPEN}</label>
                <div>
                    <label class="radio inline">
                        <input type="radio" name="allow_url_fopen" id="allow_url_fopen_on" value="on"{ALLOW_URL_FOPEN_ON}>
                        <span>{TR_YES}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="allow_url_fopen" id="allow_url_fopen_off" value="off"{ALLOW_URL_FOPEN_OFF}>
                        <span>{TR_NO}</span>
                    </label>
                </div>
            </div>
            <!-- EDP: allow_url_fopen_block -->
            <!-- BDP: display_errors_block -->
            <div class="form-element">
                <label for="display_errors">{TR_DISPLAY_ERRORS}</label>
                <div>
                    <label class="radio inline">
                        <input type="radio" name="display_errors" id="display_errors_on" value="on"{DISPLAY_ERRORS_ON}>
                        <span>{TR_YES}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="display_errors" id="display_errors_off" value="off"{DISPLAY_ERRORS_OFF}>
                        <span>{TR_NO}</span>
                    </label>
                </div>
            </div>
            <!-- EDP: display_errors_block -->
            <!-- BDP: error_reporting_block -->
            <div class="form-element">
                <label for="error_reporting">{TR_ERROR_REPORTING}</label>
                <div class="form-select">
                    <select name="error_reporting" id="error_reporting">
                        <option value="E_ALL &amp; ~E_NOTICE &amp; ~E_STRICT &amp; ~E_DEPRECATED"{ERROR_REPORTING_0}>{TR_ERROR_REPORTING_DEFAULT}</option>
                        <option value="E_ALL &amp; ~E_DEPRECATED &amp; ~E_STRICT"{ERROR_REPORTING_1}>{TR_ERROR_REPORTING_PRODUCTION}</option>
                        <option value="-1"{ERROR_REPORTING_2}>{TR_ERROR_REPORTING_DEVELOPEMENT}</option>
                    </select>
                </div>
            </div>
            <!-- EDP: error_reporting_block -->
            <!-- BDP: disable_functions_block -->
            <div class="form-element">
                <label>{TR_DISABLE_FUNCTIONS}</label>
                <div>
                    <label class="checkbox inline">
                        <input type="checkbox" name="show_source" id="show_source" value="show_source"{SHOW_SOURCE}>
                        <span>show_source</span>
                    </label>
                    <label class="checkbox inline">
                        <input type="checkbox" name="system" id="system" value="system"{SYSTEM}>
                        <span>system</span>
                    </label>
                    <label class="checkbox inline">
                        <input type="checkbox" name="shell_exec" id="shell_exec" value="shell_exec"{SHELL_EXEC}>
                        <span>shell_exec</span>
                    </label>
                    <label class="checkbox inline">
                        <input type="checkbox" name="passthru" id="passthru" value="passthru"{PASSTHRU}>
                        <span>passthru</span>
                    </label>
                    <label class="checkbox inline">
                        <input name="exec" id="exec" type="checkbox" value="exec"{EXEC}>
                        <span>exec</span>
                    </label>
                    <label class="checkbox inline">
                        <input type="checkbox" name="phpinfo" id="phpinfo" value="phpinfo"{PHPINFO}>
                        <span>phpinfo</span>
                    </label>
                    <label class="checkbox inline">
                        <input type="checkbox" name="shell" id="shell" value="shell"{SHELL}>
                        <span>shell</span>
                    </label>
                    <label class="checkbox inline">
                        <input type="checkbox" name="symlink" id="symlink" value="symlink"{SYMLINK}>
                        <span>symlink</span>
                    </label>
                    <label class="checkbox inline">
                        <input type="checkbox" name="proc_open" id="proc_open" value="proc_open"{PROC_OPEN}>
                        <span>proc_open</span>
                    </label>
                    <label class="checkbox inline">
                        <input type="checkbox" name="popen" id="popen" value="popen"{POPEN}>
                        <span>popen</span>
                    </label>
                    <!-- BDP: mail_function_block -->
                    <label class="checkbox inline">
                        <input type="checkbox" name="mail" id="mail" value="mail"{MAIL}>
                        <span>mail</span>
                    </label>
                    <!-- EDP: mail_function_block -->
                </div>
            </div>
            <!-- EDP: disable_functions_block -->
            <!-- BDP: disable_exec_block -->
            <div class="form-element">
                <label>
                    {TR_DISABLE_FUNCTIONS_EXEC}
                    <span class="tooltip-circle" data-tooltip="{TR_EXEC_HELP}">
                        <i data-eva="question-mark-circle"></i>
                    </span>
                </label>
                <div>
                    <label class="radio inline">
                        <input type="radio" name="exec" id="exec_yes" value="yes"{EXEC_YES}>
                        <span>{TR_YES}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="exec" value="no" id="exec_no"{EXEC_NO}>
                        <span>{TR_NO}</span>
                    </label>
                </div>
            </div>
            <!-- EDP: disable_exec_block -->
            <div class="form-element">
                <div class="action">
                    <button class="btn" name="Submit" type="submit">
                        {TR_UPDATE}
                    </button>
                    <a href="domains_manage.php" class="btn muted">{TR_CANCEL}</a>
                </div>
            </div>
        </section>
    </div>
</form>
