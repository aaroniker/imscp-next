<script>
    $(function() {

        function flashMessage(type, message) {
            $(".flash_message").remove();
            $("<div>", {
                "class": "flash_message " + type,
                "html": $.parseHTML(message)
            }).prependTo(".body").trigger("message_timeout");
        }

        function doRequest(data) {
            return $.post("/admin/ip_manage.php", data, null, "json").done(function () {
                window.location.href = "/admin/ip_manage.php";
            }).fail(function (jqXHR) {
                if (jqXHR.status == 403) {
                    window.location.replace("/index.php");
                } else {
                    flashMessage("error", jqXHR.responseJSON.message);
                }
            });
        }

        $.each(imscp_i18n.core.err_fields_stack, function () {
            $("#" + this).css("border-color", "#ca1d11");
        });

        var $ipNumber = $('#ip_number');
        var $netmask = $('#ip_netmask');
        var $ipCard = $('#ip_card');

        $.extend($.fn.dataTableExt.oStdClasses, {
            'sFilterInput': 'form-field sm'
        });

        $('.table > table').dataTable({
            language: imscp_i18n.core.datatable,
            stateSave: true,
            pagingType: 'simple',
            language: {
                paginate: {
                    previous: '<i data-eva="chevron-left"></i>' + imscp_i18n.core.datatable.paginate.previous,
                    next: imscp_i18n.core.datatable.paginate.next + '<i data-eva="chevron-right"></i>'
                }
            },
            dom: '<"dataTable"<"toolbar"lf><t><"paginate"ip>>',
            columnDefs: [{
                sortable: false, searchable: false, targets: [3, 4]
            }],
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
            }
        }).on('change', 'input[type="radio"]', function () {
            var $this = $(this);
            doRequest($this.parent().parent().find('input[type="radio"]').serialize()).fail(function() {
                $this.find('input:not(:checked)').prop('checked', true).button('refresh');
            });
            return false;
        }).find('tbody > tr').each(function () {
            $(this).find('td').slice(1, 3).each(function () {
                var $el = $(this).find('span').filter(':first');
                if(!$el.data('editable')) {
                    return;
                }

                let before = $el.before($('<span>', {
                    'class': 'tooltip-circle',
                    'data-tooltip': imscp_i18n.core.edit_tooltip
                }).html('<i data-eva="question-mark-circle"></i>').tooltip());
                eva.replace({
                    fill: 'currentColor'
                });
                before.on('click', function() {
                    var $elDeepCopy = $el.clone(true);
                    var $newEl = $('<div>');

                    $(this).replaceWith(function() {

                        let type = $(this).data('type');

                        switch(type) {
                            case 'netmask':
                                $newEl.html($netmask.clone().attr(
                                    'max', $(this).data('ip').indexOf(':') != -1 ? 64 : 32,
                                ).val($(this).text()).addClass('form-field sm'));
                            break;
                            case 'card':
                                $newEl.html($('<div />').addClass('form-select sm').html($ipCard.clone().val($el.text())));
                            break;
                        }

                        $newEl.append($('<input>', {
                            type: 'hidden',
                            name: 'ip_id',
                            value: $(this).data('ip-id')
                        }));

                        $newEl.on('blur', 'input, select', function() {
                            if($(this).val() != $el.text()) {
                                doRequest($(this).parent().find('input, select').serialize());
                            }
                            $el = $elDeepCopy;
                            $el.text($(this).val());

                            if(type == 'card') {
                                $(this).parent().parent().replaceWith($el);
                            } else {
                                $(this).parent().replaceWith($el);
                            }
                        });

                        return $newEl;
                    });

                    $newEl.find('input, select').focus();
                });
            });
        });

        var ipv6colC = $ipNumber.val().split(':', 3).length;
        $ipNumber.on('keyup paste copy cut', function(e, keepNetmaskVal) {
            var element = this;
            setTimeout(function() {
                var isIPv6 = $(element).val().indexOf(':') != -1;
                $netmask.attr(isIPv6 ? {
                    min: 1,
                    max: 128
                } : {
                    min: 1,
                    max: 32
                });
                var ipv6NColC = $(element).val().split(':', 3).length;
                if(!keepNetmaskVal && ((ipv6colC < 3 || (ipv6colC < 3 && ipv6NColC < 3)) || parseInt($netmask.val()) > parseInt($netmask.attr('max')))) {
                    $netmask.val(isIPv6 ? 64 : 24)
                }
                ipv6colC = ipv6NColC;
            }, 0)
        }).trigger('change', true);

        $('.delete').on('click', function() {
            return jQuery.imscp.confirmOnclick(this, sprintf(imscp_i18n.core.confirm_deletion_msg, $(this).data("ip")));
        });

    });
</script>
<div class="message static_info">{TR_TIP}</div>
<!-- BDP: ip_addresses_block -->
<div class="table sectionBox">
    <header>
        <h3>{TR_TITLE}</h3>
    </header>
    <table>
        <thead>
        <tr>
            <th>{TR_IP}</th>
            <th>{TR_IP_NETMASK}</th>
            <th>{TR_NETWORK_CARD}</th>
            <th>{TR_CONFIG_MODE}</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
            <!-- BDP: ip_address_block -->
            <tr>
                <td>
                    <strong>{IP}</strong>
                </td>
                <td class="inline-edit">
                    <span data-editable="{IP_EDITABLE}" data-type="netmask" data-ip="{IP}" data-ip-id="{IP_ID}">{IP_NETMASK}</span>
                </td>
                <td class="inline-edit">
                    <span data-editable="{IP_EDITABLE}" data-type="card" data-ip-id="{IP_ID}">{NETWORK_CARD}</span>
                </td>
                <td>
                    <!-- BDP: ip_config_mode_block -->
                    <div>
                        <label class="radio inline">
                            <input type="radio" name="ip_config_mode[{IP_ID}]" id="ip_config_mode_auto_{IP_ID}" value="auto"{IP_CONFIG_AUTO}>
                            <span>{TR_AUTO}</span>
                        </label>
                        <label class="radio inline">
                            <input type="radio" name="ip_config_mode[{IP_ID}]" id="ip_config_mode_manual_{IP_ID}" value="manual"{IP_CONFIG_MANUAL}>
                            <span>{TR_MANUAL}</span>
                        </label>
                    </div>
                    <input type="hidden" name="ip_id" value="{IP_ID}">
                    <!-- EDP: ip_config_mode_block -->
                </td>
                <td>
                    <div class="action-column">
                        <!-- BDP: ip_action_delete -->
                        <a class="btn danger sm delete" href="ip_delete.php?ip_id={ACTION_IP_ID}" data-ip="{IP}" title="{ACTION_NAME}">{ACTION_NAME}</a>
                        <!-- EDP: ip_action_delete -->
                    </div>
                </td>
            </tr>
            <!-- EDP: ip_address_block -->
        </tbody>
    </table>
</div>
<!-- EDP: ip_addresses_block -->

<!-- BDP: ip_address_form_block -->
<form name="addIpFrm" method="post" action="ip_manage.php">
    <div class="form sectionBox horizontal">
        <header>
            <h3>{TR_ADD_NEW_IP}</h3>
        </header>
        <section>
            <div class="form-element">
                <label for="ip_card">{TR_NETWORK_CARD}</label>
                <div class="form-select">
                    <select name="ip_card" id="ip_card">
                        <!-- BDP: network_card_block -->
                        <option{SELECTED}>{NETWORK_CARD}</option>
                        <!-- EDP: network_card_block -->
                    </select>
                </div>
            </div>
            <div class="form-element">
                <label>{TR_IP} / {TR_IP_NETMASK}</label>
                <div class="form-group">
                    <input class="form-field grow-3" name="ip_number" id="ip_number" type="text" value="{VALUE_IP}" maxlength="45">
                    <span class="sm">/</span>
                    <input class="form-field" name="ip_netmask" id="ip_netmask" type="number" value="{VALUE_IP_NETMASK}" min="1" max="32">
                </div>
            </div>
            <div class="form-element">
                <label>
                    {TR_CONFIG_MODE}
                    <span class="tooltip-circle" data-tooltip="{TR_CONFIG_MODE_TOOLTIPS}">
                        <i data-eva="question-mark-circle"></i>
                    </span>
                </label>
                <div>
                    <label class="radio inline">
                        <input type="radio" name="ip_config_mode" id="ip_config_mode_auto" value="auto"{IP_CONFIG_AUTO}>
                        <span>{TR_AUTO}</span>
                    </label>
                    <label class="radio inline">
                        <input type="radio" name="ip_config_mode" id="ip_config_mode_manual" value="manual"{IP_CONFIG_MANUAL}>
                        <span>{TR_MANUAL}</span>
                    </label>
                </div>
            </div>
            <div class="form-element full-width">
                <div class="action">
                    <button class="btn" name="Submit" type="submit">
                        {TR_ADD}
                    </button>
                    <a href="settings.php" class="btn muted">{TR_CANCEL}</a>
                </div>
            </div>
        </section>
    </div>
</form>
<!-- EDP: ip_address_form_block -->
