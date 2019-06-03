<script>
    $(function() {
        <!-- BDP: shared_mount_point_option_js -->
        $('input[name="shared_mount_point"]').on('change', function() {
            $('#shared_mount_point_domain').toggle(!$('#shared_mount_point_no').is(':checked'));
        }).trigger('change');
        <!-- EDP: shared_mount_point_option_js -->

        $('input[name="url_forwarding"]').on('change', function() {
            $('#tr_url_forwarding_data, #tr_type_forwarding_data').toggle(!$('#url_forwarding_no').is(':checked'));
        }).trigger('change');

        $('input[name="forward_type"]').on('change', function() {
            $('#proxy-checkbox').toggle($('#forward_type_proxy').is(':checked'));
        }).trigger('change');
    });
</script>

<form name="add_domain_alias_frm" method="post" action="alias_add.php">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_DOMAIN_ALIAS}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="domain_alias_name">{TR_DOMAIN_ALIAS_NAME}</label>
                <div class="form-group">
                    <span>www.</span>
                    <input class="form-field" type="text" name="domain_alias_name" id="domain_alias_name" value="{DOMAIN_ALIAS_NAME}">
                </div>
            </div>
            <!-- BDP: shared_mount_point_option -->
            <div class="form-element">
                <label>
                    {TR_SHARED_MOUNT_POINT}
                    <span class="tooltip-circle" data-tooltip="{TR_SHARED_MOUNT_POINT_TOOLTIP}">
                        <i data-eva="question-mark-circle"></i>
                    </span>
                </label>
                <div>
                    <label class="radio inline">
                        <input type="radio" name="shared_mount_point" id="shared_mount_point_yes" value="yes"{SHARED_MOUNT_POINT_YES}>
                        <span>{TR_YES}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="shared_mount_point" id="shared_mount_point_no" value="no"{SHARED_MOUNT_POINT_NO}>
                        <span>{TR_NO}</span>
                    </label>
                    <div class="form-select inline sm" id="shared_mount_point_domain">
                        <select name="shared_mount_point_domain">
                            <!-- BDP: shared_mount_point_domain -->
                            <option value="{DOMAIN_NAME}"{SHARED_MOUNT_POINT_DOMAIN_SELECTED}>{DOMAIN_NAME_UNICODE}</option>
                            <!-- EDP: shared_mount_point_domain -->
                        </select>
                    </div>
                </div>
            </div>
            <!-- EDP: shared_mount_point_option -->
            <div class="form-element">
                <label>
                    {TR_URL_FORWARDING}
                    <span class="tooltip-circle" data-tooltip="{TR_URL_FORWARDING_TOOLTIP}">
                        <i data-eva="question-mark-circle"></i>
                    </span>
                </label>
                <div>
                    <label class="radio inline">
                        <input type="radio" name="url_forwarding" id="url_forwarding_yes"{FORWARD_URL_YES} value="yes">
                        <span>{TR_YES}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="url_forwarding" id="url_forwarding_no"{FORWARD_URL_NO} value="no">
                        <span>{TR_NO}</span>
                    </label>
                </div>
            </div>
            <div id="tr_url_forwarding_data" class="form-element">
                <label>{TR_FORWARD_TO_URL}</label>
                <div class="form-group">
                    <div class="form-select">
                        <select name="forward_url_scheme" id="forward_url_scheme">
                            <option value="http://"{HTTP_YES}>{TR_HTTP}</option>
                            <option value="https://"{HTTPS_YES}>{TR_HTTPS}</option>
                        </select>
                    </div>
                    <input class="form-field" name="forward_url" type="text" id="forward_url" value="{FORWARD_URL}">
                </div>
            </div>
            <div id="tr_type_forwarding_data" class="form-element">
                <label>{TR_FORWARD_TYPE}</label>
                <div>
                    <label class="radio inline">
                        <input type="radio" name="forward_type" id="forward_type_301"{FORWARD_TYPE_301} value="301">
                        <span>{TR_301}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="forward_type" id="forward_type_302"{FORWARD_TYPE_302} value="302">
                        <span>{TR_302}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="forward_type" id="forward_type_303"{FORWARD_TYPE_303} value="303">
                        <span>{TR_303}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="forward_type" id="forward_type_307"{FORWARD_TYPE_307} value="307">
                        <span>{TR_307}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="forward_type" id="forward_type_proxy"{FORWARD_TYPE_PROXY} value="proxy">
                        <span>{TR_PROXY}</span>
                    </label>
                    <label id="proxy-checkbox" class="checkbox inline">
                        <input type="checkbox" name="forward_host" id="forward_host"{FORWARD_HOST}>
                        <span>{TR_PROXY_PRESERVE_HOST}</span>
                    </label>
                </div>
            </div>
            <div class="form-element">
                <div class="action">
                    <button name="Submit" type="submit" class="btn">
                        {TR_ADD}
                    </button>
                    <a href="domains_manage.php" class="btn muted">{TR_CANCEL}</a>
                </div>
            </div>
        </section>
    </div>
</form>
