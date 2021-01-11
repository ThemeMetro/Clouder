/*!
//Description: //Core scripts to handle the entire theme// This file should be included in all pages
 !**/
 
$(document).ready(function() {
	//Tooltips Function
	//--------------------------------
	$(function () {
		$("[data-rel='tooltip']").tooltip()
	});
	
    // Popover Function
	//--------------------------------
    $("[data-toggle=popover]").popover({html:true});
			
	//accordion Function
	//--------------------------------
    $('.collapse').on('show.bs.collapse', function() {
        var id = $(this).attr('id');
        $('a[href="#' + id + '"]').closest('.panel-heading').addClass('accordion-active');
        $('a[href="#' + id + '"] .panel-title span').html('<i class="fa fa-minus bigger-110"></i>');
    });
    $('.collapse').on('hide.bs.collapse', function() {
        var id = $(this).attr('id');
        $('a[href="#' + id + '"]').closest('.panel-heading').removeClass('accordion-active');
        $('a[href="#' + id + '"] .panel-title span').html('<i class="fa fa-plus bigger-110"></i>');
    });

	//Pricing Tables accordion Function
	//--------------------------------
	
	$('.TM-pricing-container .PriceList-toggle').on('click', function () {
		$('.TM-pricing-container .plan-features').collapse('toggle');
	});
	
	$('select.location-switcher').on('change', function () {
		$(':selected', this).tab('show');
	});

    /* toggle function */
    $(".toggle").on("click",function(){
        var elm = $("#"+$(this).data("toggle"));
        if(elm.is(":visible"))
            elm.addClass("hide").removeClass("show");
        else
            elm.addClass("show").removeClass("hide");
        
        return false;
    });

	// fix stackable modal issue: when 2 or more modals opened, closing one of modal will remove .modal-open class. 
	$('body').on('hide.bs.modal', function() {
		if ($('.modal:visible').size() > 1 && $('html').hasClass('modal-open') === false) {
			$('html').addClass('modal-open');
			} else if ($('.modal:visible').size() <= 1) {
				$('html').removeClass('modal-open');
		}
	});
	// fix page scrollbars issue
	$('body').on('show.bs.modal', '.modal', function() {
		if ($(this).hasClass("modal-scroll")) {
			$('body').addClass("modal-open-noscroll");
		}
	});
	
	// fix page scrollbars issue
	$('body').on('hide.bs.modal', '.modal', function() {
		$('body').removeClass("modal-open-noscroll");
	});

	// remove ajax content and remove cache on modal closed 
	$('body').on('hidden.bs.modal', '.modal:not(.modal-cached)', function () {
		$(this).removeData('bs.modal');
	});
	
	//loading state button function	
	//--------------------------------
	$(function() { 
		$("#btn-loading").click(function(){
			$(this).button('loading').delay(2000).queue(function() {
				$(this).button('reset');
				$(this).dequeue();
			});        
		});
	});
	
	// dropdown hover
	//$('li.dropdown').addClass('show-on-hover');
	
	// For WHMCS only
	$("#Secondary_Navbar-Account .dropdown-menu").addClass("dropdown-user");
	
	//back top top
	$(window).scroll(function () {
       if ($(this).scrollTop() > 50) {
               $('#back-to-top').fadeIn();
           } else {
                $('#back-to-top').fadeOut();
            }
       });
       // scroll body to 0px on click
        $('#back-to-top').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 800);
            return false;
        });	

});


// function collapse the navbar on scroll and tabs convert in select on mobile
var Apps = function () {
	return {
        init: function () {
            // init variables require in footer
			handleNavTopBar();
			handleNavTabs();
        },		
		initNavTopBar: function (els) {
				$(window).scroll(function() {
					if ($(".top-navbar").offset().top > 50) {
						$("body").addClass("top-nav-collapse");
					} else {
						$("body").removeClass("top-nav-collapse");
					}
				});
        },
		
		initNavTabs: function (els) {
		
			//set the index counter
			var i = 0;

			//convert all .nav-tabs, except those with the class .keep-tabs
			$('.nav-tabs').not( ".keep-tabs" ).each(function(){

				//init variables
				var $select,
					c       = 0,
					$select = $('<select class="mobile-nav-tabs-' +i+ ' mobile-tab-headings "></select>');

				//add unique class to nav-tabs, so each select works independently
				$(this).addClass('nav-tabs-index-'+i);

				//loop though each <li>, building each into an <option>, getting the text from the a href
				$(this).children('li').each(function() {
					$select.append('<option value="'+c+'">' + $(this).text() + '</option>');
					c++;
				});

				//insert new <select> above <ul nav-tabs>
				$(this).before($select);

				//increase index counter
				i++
			});

			//on changing <select> element
			$('[class^=mobile-nav-tabs]').on('change', function (e) {

				//get index from selected option
				classArray      = $(this).attr('class').split(" ");
				tabIndexArray   = classArray[0].split("mobile-nav-tabs-")
				tabIndex        = tabIndexArray[1];

				//using boostrap tabs, show the selected option tab
				$('.nav-tabs-index-'+tabIndex+' li a').eq($(this).val()).tab('show');
			});	
		
		},
	};
}();

/*!
//end
 !**/