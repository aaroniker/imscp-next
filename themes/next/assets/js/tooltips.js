(function($) {

    $.extend($.expr[':'], {
        'off-top': el => {
            return $(el).offset().top < $(window).scrollTop();
        },
        'off-right': el => {
            return $(el).offset().left + $(el).outerWidth() - $(window).scrollLeft() > $(window).width();
        },
        'off-bottom': el => {
            return $(el).offset().top + $(el).outerHeight() - $(window).scrollTop() > $(window).height();
        },
        'off-left': el => {
            return $(el).offset().left < $(window).scrollLeft();
        },
        'off-screen': el => {
            return $(el).is(':off-top, :off-right, :off-bottom, :off-left');
        }
    });

    $.fn.tooltip = function(options) {

        let defaults = {
            position: 'top',
            parent: $('body'),
            containerID: 'tooltip-container',
            max: 180,
            offset: 4
        };

        var settings = $.extend({}, defaults, options),
            container = $('[id=' + settings.containerID + ']').length ? $('[id=' + settings.containerID + ']') : $('<div />').attr('id', settings.containerID).appendTo(settings.parent),
            setPosition = (position, elem, container, settings) => {
                let offset = elem.offset(),
                    height = elem.outerHeight(),
                    width = elem.outerWidth(),
                    conHeight = container.outerHeight(),
                    conWidth = container.outerWidth(),
                    top = 0,
                    left = 0;
                switch(position) {
                    case 'top':
                        top = offset.top - conHeight - settings.offset;
                        left = offset.left - conWidth / 2 + width / 2;
                    break;
                    case 'left':
                        top = offset.top - conHeight / 2 + height / 2;
                        left = offset.left - conWidth - settings.offset;
                    break;
                    case 'right':
                        top = offset.top - conHeight / 2 + height / 2;
                        left = offset.left + width + settings.offset;
                    break;
                    default:
                        top = offset.top + height + settings.offset;
                        left = offset.left - conWidth / 2 + width / 2;
                }
                container.removeClass().css({
                    '--top': top + 'px',
                    '--left': left + 'px'
                }).addClass('position-' + position);
            },
            hide = container => {
                container.removeClass('show');
                setTimeout(e => {
                    container.removeClass().css({
                        '--top': 0 + 'px',
                        '--left': 0 + 'px'
                    });
                }, 200);
            };

        return this.each(function(e) {

            let elem = $(this);

            elem.on('mouseenter', e => {

                container.removeClass('show');

                container.html(elem.data('tooltip'));

                let position = elem.data('position') ? elem.data('position') : settings.position,
                    max = elem.data('max') ? elem.data('max') : settings.max;

                container.css('--max', max + 'px');

                setPosition(position, elem, container, settings);

                if(container.is(':off-top')) {
                    setPosition('bottom', elem, container, settings);
                } else if(container.is(':off-bottom')) {
                    setPosition('top', elem, container, settings);
                } else if(container.is(':off-left')) {
                    setPosition('right', elem, container, settings);
                } else if(container.is(':off-right')) {
                    setPosition('left', elem, container, settings);
                }

                container.addClass('show');

            });

            elem.on('mouseleave', e => {
                hide(container);
            });

        });

    };

})(jQuery);
