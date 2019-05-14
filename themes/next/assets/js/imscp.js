$(document).ready(function() {

    let setMinHeight = e => {
        document.documentElement.style.setProperty('--min-height', window.innerHeight + 'px');
    };

    $(window).on('resize', setMinHeight).trigger('resize');

    let body = $('body'),
        overlay = $('#overlay'),
        dialogOptions = (options, open, close, stay) => {
        return $.extend({}, options, {
            draggable: false,
            modal: true,
            resizable: false,
            witdh: 'auto',
            closeOnEscape: false,
            appendTo: '#overlay',
            open(e) {

                let elem = $(e.target).closest('.ui-dialog');

                $(e.target).removeAttr('style')
                elem.removeAttr('style');

                body.addClass('overlay');
                overlay.removeClass('hide').addClass('show');

                if(open && typeof(open) === 'function') {
                    open(e, elem);
                }

            },
            close(e) {

                let elem = $(e.target).closest('.ui-dialog');

                overlay.removeClass('show');

                setTimeout(() => {
                    body.removeClass('overlay');
                    overlay.addClass('hide');
                    if(!stay) {
                        elem.remove();
                    }
                    if(close && typeof(close) === 'function') {
                        close(e, elem);
                    }
                }, 200);

            }
        });
    };

    window.alert = (message, caption) => {
        $('<div>', {
            title: caption || imscp_i18n.core.warning
        }).dialog(dialogOptions({
            buttons: [
                {
                    text: imscp_i18n.core.ok,
                    class: 'btn sm',
                    click() {
                        $(this).dialog('close');
                    }
                }
            ]
        })).html(message);
    };

    $('#sidebar > .inner > nav > ul > li > span').on('click', e => {
        let _this = $(e.currentTarget).parent();
        _this.children('ul').slideToggle(200, e => {
            _this.toggleClass('opened');
        });
    });

    $('#mobile .burger').on('click', e => {
        $(e.currentTarget).toggleClass('active');
        $('html, body').toggleClass('openSide');
    });

    $(document).on('touchstart', function(e) {
        $('[ref="dropdown"]').removeClass('open');
    });

    $('[ref="dropdown"]').on('touchstart', function(e) {
        e.stopPropagation();
        $(this).toggleClass('open');
    });

    $('[data-tooltip]').tooltip();

    let passwordGenerator = () => {
        let input = $('.pwd_generator');
        if(input.length) {
            let inputs = $('#password, #cpassword');
            $('<div>', {
                class: 'password-generate',
                html: [
                    $('<button>', {
                        id: 'pwd_generate',
                        type: 'button',
                        class: 'btn sm',
                        text: imscp_i18n.core.generate
                    }).pGenerator({
                        'passwordElement': inputs,
                        'passwordLength': imscp_i18n.core.password_length > 16 ? imscp_i18n.core.password_length : 16,
                        'specialChars': false
                    }),
                    $('<button>', {
                        id: 'pwd_show',
                        type: 'button',
                        class: 'btn muted sm',
                        text: imscp_i18n.core.show
                    }).click(function() {
                        let password = inputs.first().val();
                        if(password != '') {
                            $('<div>', {
                                html: $('<strong>', {
                                    text: password
                                })
                            }).dialog(dialogOptions({
                                title: imscp_i18n.core.your_new_password,
                                buttons: [
                                    {
                                        text: imscp_i18n.core.close,
                                        class: 'btn sm',
                                        click() {
                                            $(this).dialog('close');
                                        }
                                    }
                                ]
                            }));
                        } else {
                            alert(imscp_i18n.core.password_generate_alert);
                        }
                    })
                ]
            }).insertAfter(input);
            if($('.pwd_prefill').length && inputs.val() == '') {
                $('#pwd_generate').trigger('click');
            }
        }
    };

    passwordGenerator();

    $.imscp = {
        confirm(message, callback, caption) {
            $('<div>', {
                title: caption || imscp_i18n.core.confirmation_required
            }).dialog(dialogOptions({
                buttons: [
                    {
                        text: imscp_i18n.core.yes,
                        class: 'btn sm',
                        click() {
                            $(this).dialog('close');
                            callback(true);
                        }
                    },
                    {
                        text: imscp_i18n.core.no,
                        class: 'btn sm muted',
                        click() {
                            $(this).dialog('close');
                            callback(false);
                        }
                    }
                ]
            })).html(message);
            return false;
        },
        confirmOnclick(link, message) {
            link.blur();
            return this.confirm(message, ret => {
                if(ret) {
                    window.location.href = link.href;
                }
            });
        }
    };

    $(function() {
        var $phpEditorDialog = $('#php_editor_dialog');
        if(!$phpEditorDialog.length) return;

        $phpEditorDialog.dialog(dialogOptions({
            autoOpen: false,
            buttons: [
                {
                    text: imscp_i18n.core.close,
                    class: 'btn sm',
                    click() {
                        $(this).dialog('close');
                    }
                }
            ]
        }, false, (e, elem) => {
            $('input').blur();
        }, true));

        $('form').submit(function(e) {
            if (!$('#php_editor_msg_default').length) {
                e.preventDefault();
                $phpEditorDialog.dialog('open');
                return false;
            }
            return true;
        });

        var $phpEditorBlock = $('#php_editor_block');
        if($phpEditorBlock.length) {
            if ($('#php_no').is(':checked')) {
                $phpEditorBlock.hide();
            }
            $('#php_yes, #php_no').change(function() {
                $phpEditorBlock.toggle();
            });
        }

        var $phpEditorDialogOpen = $('#php_editor_dialog_open');

        $phpEditorDialogOpen.click(function() {
            $phpEditorDialog.dialog('open');
        });

        if($('#php_ini_system_no').is(':checked')) {
            $phpEditorDialogOpen.hide();
        }

        $('#php_ini_system_yes, #php_ini_system_no').change(function() {
            $phpEditorDialogOpen.fadeToggle();
        });

        var $errorMessages = $('.php_editor_error');

        function _updateMesssages(k, t) {
            if(typeof(t) != 'undefined') {
                if(!$('#err_' + k).length) {
                    $('#php_editor_msg_default').remove();
                    $errorMessages.append('<span style="display:block" id="err_' + k + '">' + t + '</span>').removeClass('static_success').addClass('static_error');
                }
            } else if($('#err_' + k).length) {
                $('#err_' + k).remove();
            }

            if($.trim($errorMessages.text()) == '') {
                $errorMessages.empty().append('<span id="php_editor_msg_default">' + imscp_i18n.core.fields_ok + '</span>').removeClass('static_error').addClass('static_success');
            }
        }

        var timerId;
        var $iniFields = $('#php_ini_values').find('input');

        $iniFields.on('keyup click', function () {
            clearTimeout(timerId);
            timerId = setTimeout(function () {
                $iniFields.each(function () { // We revalidate all fields because some are dependent of others
                    var id = $(this).attr("id");
                    var curLimit = parseInt($(this).val() || 0);
                    var maxLimit = parseInt($(this).attr('max'));

                    if(curLimit < 1 || curLimit > maxLimit) {
                        $(this).addClass('ui-state-error');
                        _updateMesssages(id, sprintf(imscp_i18n.core.out_of_range_value_error, '<strong>' + id + '</strong>', 1, maxLimit));
                    } else if(id == 'upload_max_filesize' && parseInt($('#post_max_size').val()) < curLimit) {
                        $(this).addClass('ui-state-error');
                        _updateMesssages(id, sprintf(imscp_i18n.core.lower_value_expected_error, '<strong>' + id + '</strong>', '<strong>post_max_size</strong>'));
                    } else {
                        $(this).removeClass('ui-state-error');
                        _updateMesssages(id);
                    }
                });
            }, 200);
        }).first().trigger('keyup');
    });

    $(function() {
        if(!$('.ftp_choose_dir').length) return;

        $('body').on('click', '.ftp_choose_dir', function () {
            let $dialog = $('#ftp_choose_dir_dialog');
            if($dialog.length) {
                let link = $(this).data('link') || 'none';
                if(link == 'none') {
                    var directory = $(this).data('directory');
                    if(directory == '') directory = '/';
                    $('#ftp_directory').val(directory);
                    $dialog.dialog('close');
                } else {
                    $.get(link, data => {
                        $dialog.html(data).dialog('open');
                    }).fail(response => {
                        alert('Request failed');
                    });
                }
            } else {
                $.get('/shared/ftp_choose_dir.php', data => {
                    $dialog = $('<div id="ftp_choose_dir_dialog">').html(data).dialog(dialogOptions({
                        autoOpen: true,
                        buttons: [
                            {
                                text: imscp_i18n.core.close,
                                class: 'btn sm',
                                click() {
                                    $(this).dialog('close');
                                }
                            }
                        ]
                    }));
                }).fail(response => {
                    alert('Request failed')
                });
            }
        });
    });

});

function sbmt(form, uaction) {
    form.uaction.value = uaction;
    form.submit();
    return false;
}

/**
 *
 * Javascript sprintf by http://jan.moesen.nu/
 * This code is in the public domain.
 *
 * %% - Returns a percent sign
 * %b - Binary number
 * %c - The character according to the ASCII value
 * %d - Signed decimal number
 * %u - Unsigned decimal number
 * %f - Floating-point number
 * %o - Octal number
 * %s - String
 * %x - Hexadecimal number (lowercase letters)
 * %X - Hexadecimal number (uppercase letters)
 *
 * @todo check use of radix parameter of parseInt for (pType == 'o')
 * @todo check use of radix parameter of parseInt for (pType == 'x')
 * @todo check use of radix parameter of parseInt for (pType == 'X')
 */
function sprintf() {
    if (!arguments || arguments.length < 1 || !RegExp) {
        return;
    }

    var str = arguments[0];
    var re = /([^%]*)%('.|0|\x20)?(-)?(\d+)?(\.\d+)?(%|b|c|d|u|f|o|s|x|X)(.*)/;
    var a = [], b = [], numSubstitutions = 0, numMatches = 0;

    while ((a = re.exec(str))) {
        var leftpart = a[1], pPad = a[2], pJustify = a[3], pMinLength = a[4];
        var pPrecision = a[5], pType = a[6], rightPart = a[7];

        numMatches++;
        var subst;

        if (pType == '%') {
            subst = '%';
        } else {
            numSubstitutions++;
            if (numSubstitutions >= arguments.length) {
                alert('Error! Not enough function arguments (' + (arguments.length - 1) + ', excluding the string)\nfor the number of substitution parameters in string (' + numSubstitutions + ' so far).');
            }

            var param = arguments[numSubstitutions];
            var pad = '';
            if (pPad && pPad.substr(0, 1) == "'") {
                pad = leftpart.substr(1, 1);
            } else if (pPad) {
                pad = pPad;
            }

            var justifyRight = true;
            if (pJustify && pJustify === "-") {
                justifyRight = false;
            }

            var minLength = -1;
            if (pMinLength) {
                minLength = parseInt(pMinLength, 10);
            }

            var precision = -1;
            if (pPrecision && pType == 'f') {
                precision = parseInt(pPrecision.substring(1), 10);
            }

            subst = param;
            if (pType == 'b') {
                subst = parseInt(param, 10).toString(2);
            } else if (pType == 'c') {
                subst = String.fromCharCode(parseInt(param, 10));
            } else if (pType == 'd') {
                subst = parseInt(param, 10) ? parseInt(param, 10) : 0;
            } else if (pType == 'u') {
                subst = Math.abs(param);
            } else if (pType == 'f') {
                subst = (precision > -1) ? Math.round(parseFloat(param) * Math.pow(10, precision)) / Math.pow(10, precision) : parseFloat(param);
            } else if (pType == 'o') {
                subst = parseInt(param).toString(8);
            } else if (pType == 's') {
                subst = param;
            } else if (pType == 'x') {
                subst = ('' + parseInt(param).toString(16)).toLowerCase();
            } else if (pType == 'X') {
                subst = ('' + parseInt(param).toString(16)).toUpperCase();
            }
        }
        str = leftpart + subst + rightPart;
    }

    return str;
}
