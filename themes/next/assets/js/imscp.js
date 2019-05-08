$(document).ready(function() {

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

    $('#overview-stats .box strong').each(function() {
        let _this = $(this),
            text = _this.text();
        _this.text(text.indexOf(' ') > -1 ? text.split(' ')[0] : text);
    });

    // Function to initialize buttons
    var initButtons = () => {
        $(".radio, .checkbox").buttonset();
    };

    // Function to initialize tables
    var initTables = function() {
        $("body").on("updateTable", "table", function () {
            $(this).find("tbody:first > tr:visible:odd").removeClass("odd").addClass("even");
            $(this).find("tbody:first > tr:visible:even").removeClass("even").addClass("odd");
        });
        $("tbody").trigger("updateTable");

        // Override some built-in jQuery method to automatically trigger the i-MSCP updateTable event
        var origShow = $.fn.show;
        $.fn.show = function () {
            return origShow.apply(this, arguments).trigger("updateTable");
        };
        var origHide = $.fn.hide;
        $.fn.hide = function () {
            return origHide.apply(this, arguments).trigger("updateTable");
        };
    };

    // Function to initialize password generator
    // To enable the password generator for a password input field, just add the .pwd_generator class to it
    // Only password input fields with the password and cpassword identifier are filled
    var passwordGenerator = function() {
        var $pwdGenerator = $(".pwd_generator");

        if($pwdGenerator.length) {
            var $pwdElements = $("#password,#cpassword");

            $("<span>", {
                style: "display:inline-block;margin-left:5px",
                html: [
                    $("<button>", { id: "pwd_generate", type: "button", text: imscp_i18n.core.generate }).pGenerator({
                        'passwordElement': $pwdElements,
                        'passwordLength': imscp_i18n.core.password_length > 16 ? imscp_i18n.core.password_length : 16,
                        'specialChars': false
                    }),
                    $("<button>", { id: "pwd_show", type: "button", text: imscp_i18n.core.show }).click(function() {
                        var password = $pwdElements.first().val();
                        if (password != '') {
                            $('<div>', { html: $("<strong>", { text: password }) }).dialog({
                                modal: true,
                                hide: "blind",
                                show: "blind",
                                title: imscp_i18n.core.your_new_password,
                                buttons: [
                                    {
                                        text: imscp_i18n.core.close,
                                        click: function () { $(this).dialog("destroy").remove(); }
                                    }
                                ]
                            });
                        } else {
                            alert(imscp_i18n.core.password_generate_alert);
                        }
                    })
                ]
            }).insertAfter($pwdGenerator);

            // Prefill password field if needed
            if($(".pwd_prefill").length && $pwdElements.val() == '') {
                $("#pwd_generate").trigger("click");
            }
        }
    };

    var initLayout = () => {
        passwordGenerator();
        initTables();
        initButtons();
    };

    $(function() {
        initLayout();
    });

});

// Functions for confirmation and alert dialogs
(function ($) {
    // Override native alert() function
    window.alert = function (message, caption) {
        caption = caption || imscp_i18n.core.warning;

        $("<div>", {title: caption}).dialog({
            draggable: false,
            modal: true,
            resizable: false,
            witdh: 'auto',
            closeOnEscape: false,
            open: function (event, ui) {
                $(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
            },
            buttons: [
                {
                    text: imscp_i18n.core.ok,
                    click: function () {
                        $(this).dialog('close');
                    }
                }
            ],
            close: function () {
                $(this).remove()
            }
        }).html(message);
    };

    $.imscp = {
        confirm: function (message, callback, caption) {
            caption = caption || imscp_i18n.core.confirmation_required;

            $("<div>", {title: caption}).dialog({
                draggable: false,
                modal: true,
                resizable: false,
                witdh: 'auto',
                closeOnEscape: false,
                open: function (event, ui) {
                    $(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
                },
                buttons: [
                    {
                        text: imscp_i18n.core.yes,
                        click: function () {
                            $(this).dialog('close');
                            callback(true);
                        }
                    },
                    {
                        text: imscp_i18n.core.no,
                        click: function () {
                            $(this).dialog('close');
                            callback(false)
                        }
                    }
                ],
                close: function () {
                    $(this).remove()
                }
            }).html(message);

            return false;
        },
        confirmOnclick: function (link, message) {
            link.blur();
            return this.confirm(message, function (ret) {
                if (ret) {
                    window.location.href = link.href;
                }
            });
        }
    };
})(jQuery);

// PHP editor (dialog and validation routines)
(function ($) {
    $(function () {
        var $phpEditorDialog = $("#php_editor_dialog");
        if (!$phpEditorDialog.length) return; // Avoid attaching event handler when not necessary

        $phpEditorDialog.dialog({
            hide: "blind",
            show: "slide",
            focus: false,
            autoOpen: false,
            width: 650,
            modal: true,
            appendTo: "form",
            buttons: [
                {
                    text: imscp_i18n.core.close,
                    click: function () {
                        $(this).dialog("close");
                    }
                }
            ],
            open: function () {
                var $dialog = $(this);
                $(window).on("resize scroll", function() {
                    $dialog.dialog("option", "position", { my: "center", at: "center", of: window });
                });
            },
            close: function() {
                $('input').blur();
                $(window).off("resize scroll");
            }
        });

        // Prevent form submission in case an INI value is not valid
        $("form").submit(function (e) {
            if (!$("#php_editor_msg_default").length) {
                e.preventDefault();
                $phpEditorDialog.dialog("open");
                return false;
            }

            return true;
        });

        var $phpEditorBlock = $("#php_editor_block");
        if($phpEditorBlock.length) {
            if ($("#php_no").is(":checked")) {
                $phpEditorBlock.hide();
            }

            $("#php_yes,#php_no").change(function () {
                $phpEditorBlock.toggle();
            });
        }

        var $phpEditorDialogOpen = $("#php_editor_dialog_open");

        $phpEditorDialogOpen.button("option", "icons", { primary: "ui-icon-gear" }).click(function () {
            $phpEditorDialog.dialog("open");
        });

        if ($("#php_ini_system_no").is(":checked")) {
            $phpEditorDialogOpen.hide();
        }

        $("#php_ini_system_yes, #php_ini_system_no").change(function () {
            $phpEditorDialogOpen.fadeToggle();
        });

        var $errorMessages = $(".php_editor_error");

        function _updateMesssages(k, t) {
            if (typeof(t) != "undefined") {
                if (!$("#err_" + k).length) {
                    $("#php_editor_msg_default").remove();
                    $errorMessages.append('<span style="display:block" id="err_' + k + '">' + t + "</span>").
                        removeClass("static_success").addClass("static_error");
                }
            } else if ($("#err_" + k).length) {
                $("#err_" + k).remove();
            }

            if ($.trim($errorMessages.text()) == "") {
                $errorMessages.empty().append('<span id="php_editor_msg_default">' + imscp_i18n.core.fields_ok + '</span>').
                    removeClass("static_error").addClass("static_success");
            }
        }

        var timerId;
        var $iniFields = $("#php_ini_values").find("input");

        $iniFields.on('keyup click', function () {
            clearTimeout(timerId);
            timerId = setTimeout(function () {
                $iniFields.each(function () { // We revalidate all fields because some are dependent of others
                    var id = $(this).attr("id");
                    var curLimit = parseInt($(this).val() || 0);
                    var maxLimit = parseInt($(this).attr("max"));

                    if (curLimit < 1 || curLimit > maxLimit) {
                        $(this).addClass("ui-state-error");
                        _updateMesssages(id, sprintf(imscp_i18n.core.out_of_range_value_error, '<strong>' + id + '</strong>', 1, maxLimit));
                    } else if (id == 'upload_max_filesize' && parseInt($("#post_max_size").val()) < curLimit) {
                        $(this).addClass("ui-state-error");
                        _updateMesssages(id, sprintf(imscp_i18n.core.lower_value_expected_error, '<strong>' + id + '</strong>', '<strong>post_max_size</strong>'));
                    } else {
                        $(this).removeClass("ui-state-error");
                        _updateMesssages(id);
                    }
                });
            }, 200);
        }).first().trigger('keyup'); // We trigger the keyup event on page load to catch any inconsistency with ini values
    })
})(jQuery);

// Initialize FTP chooser event handler
(function($) {
    $(function() {
        if(!$(".ftp_choose_dir").length) return; // Avoid attaching event handler when not necessary

        $("body").on("click", ".ftp_choose_dir", function () {
            var $dialog = $("#ftp_choose_dir_dialog");

            if($dialog.length) {
                var link = $(this).data("link") || 'none';

                if(link == "none") { // 'none' means that we want set directory.
                    var directory = $(this).data("directory");
                    if(directory == '') directory = '/';
                    $("#ftp_directory").val(directory);
                    $dialog.dialog("close");
                } else { // We already have a dialog. We just need to update it content
                    $.get(link, function(data) {
                        $dialog.html(data).dialog("open").find('table').trigger('updateTable').tooltip();
                    }).fail(function() {
                        alert("Request failed");
                    });
                }
            } else { // No dialog. We create one
                $.get("/shared/ftp_choose_dir.php", function(data) {
                    $dialog = $('<div id="ftp_choose_dir_dialog">').html(data).dialog({
                        hide: "blind",
                        show: "slide",
                        focus: false,
                        width: 650,
                        height: 500,
                        autoOpen: true,
                        appendTo: "body",
                        modal: true,
                        title: imscp_i18n.core.ftp_directories,
                        buttons: [{
                            text: imscp_i18n.core.close,
                            click: function () {
                                $(this).dialog("close");
                            }
                        }],
                        open: function () {
                            var $dialog = $(this);
                            $dialog.find('table').trigger('updateTable').tooltip();
                            $(window).on("resize scroll", function() {
                                $dialog.dialog("option", "position", { my: "center", at: "center", of: window });
                            });
                        },
                        close: function () {
                            $(window).off("resize scroll");
                            $(this).remove();
                        }
                    });
                }).fail(function() {
                    alert("Request failed")
                });
            }
        });
    });
})(jQuery);

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
