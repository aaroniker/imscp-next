<script>

    function action_delete(link, service) {
        return jQuery.imscp.confirmOnclick(link, sprintf("{TR_MESSAGE_DELETE}", service));
    }

    var error_fields_ids = {ERROR_FIELDS_IDS};

    $(function () {

        $.each(error_fields_ids, function () {
            $("#" + this).css({ "border": "1px solid red", "font-weight": "bolder" });
        });

        $('input[name=submitForReset]').click(function () {
            $('input[name=uaction]').val('reset');
        });

    });

</script>

<!-- start form edit -->
<form name="editFrm" method="post" action="settings_ports.php">
    <div class="table dataTable-static sectionBox">
        <header>
            <h3>{TR_TITLE}</h3>
        </header>
        <table>
            <thead>
                <tr>
                    <th>{TR_SERVICE}</th>
                    <th>{TR_IP}</th>
                    <th>{TR_PORT}</th>
                    <th>{TR_PROTOCOL}</th>
                    <th>{TR_SHOW}</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <!-- BDP: service_ports -->
                <tr>
                    <td data-th="{TR_SERVICE}">
                        <input class="form-field sm" name="name[]" type="text" id="name{NUM}" value="{NAME}" class="textinput" maxlength="25">
                        <input class="form-field sm" name="var_name[]" type="hidden" id="var_name{NUM}" value="{VAR_NAME}">
                    </td>
                    <td data-th="{TR_IP}">
                        <input class="form-field sm" name="ip[]" type="text" id="ip{NUM}" value="{IP}" maxlength="40">
                    </td>
                    <td data-th="{TR_PORT}">
                        <input class="form-field sm" name="port[]" type="number" id="port{NUM}" value="{PORT}" min="1" max="65535">
                    </td>
                    <td data-th="{TR_PROTOCOL}">
                        <div class="form-select sm">
                            <select name="port_type[]" id="port_type{NUM}">
                                <option value="udp"{SELECTED_UDP}>UDP</option>
                                <option value="tcp"{SELECTED_TCP}>TCP</option>
                            </select>
                        </div>
                    </td>
                    <td data-th="{TR_SHOW}">
                        <div class="form-select sm">
                            <select name="show_val[]" id="show_val{NUM}">
                                <option value="1"{SELECTED_ON}>{TR_YES}</option>
                                <option value="0"{SELECTED_OFF}>{TR_NO}</option>
                            </select>
                        </div>
                    </td>
                    <td>
                        <div class="action-column">
                            <a class="btn sm danger" href="settings_ports.php?delete={DELETE_ID}" onclick="return action_delete(this, '{NAME}')">{TR_DELETE}</a>
                        </div>
                    </td>
                </tr>
                <!-- EDP: service_ports -->
            </tbody>
        </table>
        <footer class="align-right">
            <input type="hidden" name="uaction" value="update">
            <input name="submitForReset" type="submit" value="{VAL_FOR_SUBMIT_ON_RESET}" class="btn muted">
            <input name="submitForUpdate" type="submit" value="{VAL_FOR_SUBMIT_ON_UPDATE}" class="btn">
        </footer>
    </div>
</form>

<form name="addFrm" method="post" action="settings_ports.php">
    <div class="form sectionBox horizontal">
        <section class="two-columns">
            <div class="form-element">
                <label for="name">{TR_SERVICE}</label>
                <input class="form-field" name="name_new" type="text" id="name" value="{VAL_FOR_NAME_NEW}" maxlength="25">
            </div>
            <div class="form-element">
                <label for="ip">{TR_IP}</label>
                <input class="form-field" name="ip_new" type="text" id="ip" value="{VAL_FOR_IP_NEW}" maxlength="45">
            </div>
            <div class="form-element">
                <label for="port">{TR_PORT}</label>
                <input class="form-field" name="port_new" type="number" id="port" value="{VAL_FOR_PORT_NEW}" min="1" max="65535">
            </div>
            <div class="form-element">
                <label for="port_type">{TR_PROTOCOL}</label>
                <div class="form-select">
                    <select name="port_type_new" id="port_type">
                        <option value="udp">UDP</option>
                        <option value="tcp" selected>TCP</option>
                    </select>
                </div>
            </div>
            <div class="form-element">
                <label for="show_val">{TR_SHOW}</label>
                <div class="form-select">
                    <select name="show_val_new" id="show_val">
                        <option value="1" selected>{TR_YES}</option>
                        <option value="0">{TR_NO}</option>
                    </select>
                </div>
            </div>
            <div class="form-element">
                <div class="action">
                    <button name="submitForAdd" type="submit" class="btn">
                        {VAL_FOR_SUBMIT_ON_ADD}
                    </button>
                    <input type="hidden" name="uaction" value="add">
                </div>
            </div>
        </section>
    </div>
</form>
