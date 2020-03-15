
(function($) {
    "use strict";
    /*==============================
        Is mobile
    ==============================*/
    var isMobile = {
        Android: function() {
            return navigator.userAgent.match(/Android/i);
        },
        BlackBerry: function() {
            return navigator.userAgent.match(/BlackBerry/i);
        },
        iOS: function() {
            return navigator.userAgent.match(/iPhone|iPad|iPod/i);
        },
        Opera: function() {
            return navigator.userAgent.match(/Opera Mini/i);
        },
        Windows: function() {
            return navigator.userAgent.match(/IEMobile/i);
        },
        any: function() {
            return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
        }
    }

    /*==============================
        Main
    ==============================*/
    
    function main() {}

    /* Datepicker */
    DatePicker();
    function DatePicker() {
        $( ".apb-calendar" ).datepicker({
            prevText: '<i class="fa fa-chevron-left"></i>',
            nextText: '<i class="fa fa-chevron-right"></i>',
            buttonImageOnly: false,
            beforeShow: function(input, inst) {
               $('#ui-datepicker-div').addClass('apb-datepicker');
           }
        });
    }

    /* Select */
    apbSelect();
    function apbSelect() {
        $('.apb-select').each(function() {
            var apbselect = $(this);
            apbselect.wrap('<div class="apb-select-wrapper"></div>');
            apbselect.after('<i class="fa fa-angle-down"></i>');
        });
    }

    /* apbCalendar */
    apbCalendar();
    function apbCalendar() {
        $('.apb-calendar').each(function() {
            var apbselect = $(this);
            apbselect.wrap('<div class="apb-calendar-wrapper"></div>');
            apbselect.after('<i class="fa fa-calendar"></i>');
        });
    }

    /*abp Product Compare*/
    apbProductCompare();
    function apbProductCompare() {

        if($('.apb-compare_slide').length ) {
            $(".apb-compare_slide").owlCarousel({
                margin: 30,
                loop: true,
                nav: true,
                navText:["<i class='fa fa-chevron-left'></i>","<i class='fa fa-chevron-right'></i>"],
                responsive: {
                    992: {
                        items: 3
                    },

                    600: {
                        items: 2
                    },

                    0: {
                        items: 1
                    }
                }
            });
        }
    }

    /*abp Product Thumbs*/
    apbProductThumbs();
    function apbProductThumbs() {

        if($('.apb-product_image').length ) {

            $('.apb-product_image').fotorama({
              width: '100%',
              maxwidth: '100%',
              allowfullscreen: true,
              nav: 'thumbs'
            });
        }
    }

    $(document).ready(function() {

        $(window).load(function() {

        });
        
    });
})(jQuery);