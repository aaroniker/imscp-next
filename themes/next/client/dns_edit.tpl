<script>

    $(function () {
        $('#zone_id').on('change', function() {
            $('#origin').html('<strong>' + $(this).find('option:selected').text() + '.</strong>');
        }).trigger('change');
    });

    let inputFields = ['name', 'ip_address', 'ip_address_v6', 'srv_name', 'srv_protocol', 'srv_ttl', 'srv_prio', 'srv_weight', 'srv_host', 'srv_port', 'cname', 'txt_data'],
        inputFieldsLength = inputFields.length;

    function dns_show_rows(inputFieldsToShow) {
        for(let i = 0; i < inputFieldsLength; i++) {
            let trName = 'tr_dns_' + inputFields[i],
                $o = $('#' + trName);
            $o.toggle($.inArray(inputFields[i], inputFieldsToShow) != -1);
        }
    }

    function change_dns_type(value) {
        if(value == 'A') {
            dns_show_rows(['name', 'srv_ttl', 'ip_address']);
        } else if (value == 'AAAA') {
            dns_show_rows(['name', 'srv_ttl', 'ip_address_v6']);
        } else if (value == 'MX') {
            dns_show_rows(['name', 'srv_ttl', 'srv_prio', 'srv_host']);
        } else if (value == 'NS') {
            dns_show_rows(['name', 'srv_ttl', 'srv_host']);
        } else if (value == 'CNAME') {
            dns_show_rows(['name', 'srv_ttl', 'cname']);
        } else if (value == 'SPF' || value == 'TXT') {
            dns_show_rows(['name', 'srv_ttl', 'txt_data']);
        } else if (value == 'SRV') {
            dns_show_rows(['srv_name', 'srv_protocol', 'name', 'srv_ttl', 'srv_prio', 'srv_weight', 'srv_host', 'srv_port']);
        }
    }

    const IPADDRESS = "[0-9.]";
    const IPv6ADDRESS = "[0-9a-f:A-F]";
    const NUMBERS = "[0-9]";

    function filterChars(e, allowed) {
        var keynum;
        if(window.event) {
            keynum = window.event.keyCode;
            e = window.event;
        } else if(e) {
            keynum = e.which;
        } else {
            return true;
        }

        if((keynum == 8) || (keynum == 0)) {
            return true;
        }

        let keychar = String.fromCharCode(keynum);

        if(e.ctrlKey && ((keychar == "C") || (keychar == "c") || (keychar == "V") || (keychar == "v"))) {
            return true;
        }

        var regexp = new RegExp(allowed);
        return regexp.test(keychar);
    }

    $(function () {
        change_dns_type($('#dns_type').val());
    });

</script>

<div class="message static_info">
    <?= tr('$ORIGIN is automatically appended to unqualified names, hosts and canonical names') ?>.<br>
    <?= tr('If the name field is filled with the @ sign or left blank, it will be automatically substituted by $ORIGIN value.') ?>
    <br>
    <?= tr('$ORIGIN value is currently set to: %s', '<span id="origin"></span>') ?>
</div>

<form name="edit_dns_frm" method="post" action="{ACTION_MODE}">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_CUSTOM_DNS_RECORD}</h3>
        </header>
        <section>
            <!-- BDP: add_record -->
            <div class="form-element">
                <label for="zone_id">
                    {TR_ZONE}
                    <span class="tooltip-circle" data-tooltip="{TR_ZONE_HELP}">
                        <i data-eva="question-mark-circle"></i>
                    </span>
                </label>
                <div class="form-select">
                    <select id="zone_id" name="zone_id">
                        {SELECT_ZONES}
                    </select>
                </div>
            </div>
            <!-- EDP: add_record -->
            <div id="tr_dns_srv_name" class="form-element">
                <label for="dns_srv_name">{TR_DNS_SRV_NAME}</label>
                <input id="dns_srv_name" type="text" name="dns_srv_name" value="{DNS_SRV_NAME}" class="form-field" placeholder="_sip">
            </div>
            <div id="tr_dns_srv_protocol" class="form-element">
                <label for="srv_protocol">{TR_DNS_SRV_PROTOCOL}</label>
                <div class="form-select">
                    <select name="srv_proto" id="srv_protocol">
                        {SELECT_DNS_SRV_PROTOCOL}
                    </select>
                </div>
            </div>
            <div id="tr_dns_name" class="form-element">
                <label for="dns_name">{TR_DNS_NAME}</label>
                <input id="dns_name" type="text" name="dns_name" value="{DNS_NAME}" class="form-field">
            </div>
            <div id="tr_dns_ttl" class="form-element">
                <label for="dns_ttl">{TR_DNS_NAME}</label>
                <div class="form-group">
                    <input class="form-field" id="dns_ttl" type="number" min="60" max="2147483647" name="dns_ttl" value="{DNS_TTL}">
                    <span>{TR_SEC}</span>
                </div>
            </div>
            <div class="form-element">
                <label for="class">{TR_DNS_CLASS}</label>
                <div class="form-select">
                    <select id="class" name="class">
                        {SELECT_DNS_CLASS}
                    </select>
                </div>
            </div>
            <div class="form-element">
                <label for="dns_type">{TR_DNS_TYPE}</label>
                <div class="form-select">
                    <select id="dns_type" onchange="change_dns_type(this.value)" name="type"{DNS_TYPE_DISABLED}>
                        {SELECT_DNS_TYPE}
                    </select>
                </div>
            </div>
            <div id="tr_dns_ip_address" class="form-element">
                <label for="dns_A_address">{TR_DNS_IP_ADDRESS}</label>
                <input id="dns_A_address" type="text" onkeypress="return filterChars(event, IPADDRESS);" name="dns_A_address" value="{DNS_ADDRESS}" class="form-field">
            </div>

            <div id="tr_dns_ip_address_v6" class="form-element">
                <label for="dns_AAAA_address">{TR_DNS_IP_ADDRESS_V6}</label>
                <input id="dns_AAAA_address" type="text" onkeypress="return filterChars(event, IPv6ADDRESS);" name="dns_AAAA_address" value="{DNS_ADDRESS_V6}" class="form-field">
            </div>
            <div id="tr_dns_srv_prio" class="form-element">
                <label for="dns_srv_prio">{TR_DNS_SRV_PRIO}</label>
                <input class="form-field" id="dns_srv_prio" type="number" min="0" max="65535" name="dns_srv_prio" value="{DNS_SRV_PRIO}">
            </div>
            <div id="tr_dns_srv_weight" class="form-element">
                <label for="dns_srv_weight">{TR_DNS_SRV_WEIGHT}</label>
                <input class="form-field" id="dns_srv_weight" type="number" min="0" max="65535" name="dns_srv_weight" value="{DNS_SRV_WEIGHT}">
            </div>
            <div id="tr_dns_srv_port" class="form-element">
                <label for="dns_srv_port">{TR_DNS_SRV_PORT}</label>
                <input class="form-field" id="dns_srv_port" type="text" onkeypress="return filterChars(event, NUMBERS);" name="dns_srv_port" value="{DNS_SRV_PORT}">
            </div>
            <div id="tr_dns_srv_host" class="form-element">
                <label for="dns_srv_host">{TR_DNS_SRV_HOST}</label>
                <input class="form-field" id="dns_srv_host" type="text" name="dns_srv_host" value="{DNS_SRV_HOST}">
            </div>
            <div id="tr_dns_cname" class="form-element">
                <label for="dns_cname">{TR_DNS_CNAME}</label>
                <input id="dns_cname" type="text" name="dns_cname" value="{DNS_CNAME}" class="form-field">
            </div>
            <div id="tr_dns_txt_data" class="form-element">
                <label for="dns_txt_data">{TR_DNS_TXT_DATA}</label>
                <textarea id="dns_txt_data" name="dns_txt_data" class="form-field">{DNS_TXT_DATA}</textarea>
            </div>
            <div class="form-element">
                <div class="action">
                    <!-- BDP: form_edit_mode -->
                    <input name="Submit" type="submit" value="{TR_UPDATE}" class="btn">
                    <!-- EDP: form_edit_mode -->
                    <!-- BDP: form_add_mode -->
                    <input name="Submit" type="submit" value="{TR_ADD}" class="btn">
                    <!-- EDP: form_add_mode -->
                    <a class="btn muted" href="domains_manage.php">{TR_CANCEL}</a>
                </div>
            </div>
        </section>
    </div>
</form>
