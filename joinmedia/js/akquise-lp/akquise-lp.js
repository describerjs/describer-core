//@prepros-prepend libs/matchMedia.js
//@prepros-prepend libs/matchMedia.addListener.js
//@prepros-prepend libs/jquery-2.1.1.js
//@prepros-prepend libs/jquery.kinetic.js
//@prepros-prepend libs/enquire.js
//@prepros-prepend libs/picturefill.js

$(document).ready(function() {

	var phone = $('.scroll-inner');
    enquire.register("screen and (min-width:46.875em)", {
        match: function() {
            setTimeout(function() {
                var scrollPhone = setInterval(function() {
                    var pos = phone.scrollTop();
                    phone.scrollTop(pos + 1);
                }, 30);

                phone.mouseenter(function() {
                    clearInterval(scrollPhone);
                });
            }, 1500);
           
            // Dragable smartphone
            var $scroller = phone.kinetic({
                cursor: 'ns-resize',
                x: false,
                slowdown: 0.6
            });
        },
    });

	// Anchor Smoothing
	$('.btn-down').click(function(){
        $('html, body').animate({
          scrollTop: $( $.attr(this, 'href') ).offset().top-50
        }, 800);
        return false;
	});

    // Close notification
    $('.notification-close').click(function() {
        $('.notification').addClass('hide');
        return false;
    });

    // Modals
    var buttonPressed       = false, 
        landingpage         = window.location.pathname.replace(/\//g, ''),
        modals              = $('.modal'),
        inputName           = $('#name'),
        inputMailTel        = $('#emailTel'),
        inputTerminwunsch   = $('#terminwunsch');

    $('[data-jmname="modal"]').click(function() {
        var element     = $(this),
            modalName   = '.' + element.attr('href').replace('#',''),
            modal       = $(modalName),
            marginTop  = $(window).scrollTop();

        if(element.data('jmkontakt') !== undefined) {
            kontaktformular(modalName, modal, marginTop);
        } else {
            toggleModal(modal, marginTop);
        }

        return false;
    });

    // Modal schließen
    $('.modal-close').click(function() {
        modals.removeClass('fadeIn')
        setTimeout(function() {
            modals.removeClass('visible');
        },100);
        return false;
    });

    // Kontaktformular
    function kontaktformular(modalName, modal, marginTop) {
        if(modalName === '.modal-kontakt-one') {
            // Erste E-Mail senden
            if(!buttonPressed) {
                var mailParameter = '?kontakt=' + landingpage + '&message=Button wurde gedrückt.';
                $.post('/handler/Kontakt.ashx' + mailParameter);
                console.log(mailParameter);
                buttonPressed = true;
            }
            toggleModal(modalName, marginTop);
        } else if(modalName === '.modal-kontakt-two') {
            var inputNameValue      = $.trim(inputName.val()),
                inputMailTelValue   = $.trim(inputMailTel.val()),
                mailParameter       = '?kontakt=' + landingpage + '&message=Tel/Mail: ' + inputMailTelValue + ' Ansprechpartner: ' + inputNameValue;

            // Zweite E-Mail senden
            if(inputNameValue !== '' && inputMailTelValue !== '') {
                $.post('/handler/Kontakt.ashx' + mailParameter);
                console.log(mailParameter);
                toggleModal(modalName, marginTop);
            }
        } else if(modalName === '.modal-kontakt-three') {
            var inputTerminwunschValue  = $.trim(inputTerminwunsch.val()),
                mailParameter           = '?kontakt=' + landingpage + '&message=Terminwunsch: ' + inputTerminwunschValue;

            // Dritte E-Mail senden
            if(inputTerminwunschValue !== '') {
                $.post('/handler/Kontakt.ashx' + mailParameter);
                console.log(mailParameter);
                toggleModal(modalName, marginTop);
            }
        } 
    }

    function toggleModal(modal, marginTop) {
        modals.removeClass('visible fadeIn');
        $(modal).children('.modal-inner').css('margin-top', marginTop);
        $(modal).addClass('visible');
        setTimeout(function() {
            $(modal).addClass('fadeIn');
        },100);
    }

});