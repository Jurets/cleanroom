$(document).ready(function() {

/*------------simple menu-------------*/						   
	$("#menu_top > li:first-child").addClass('first');
	$("#menu_top li").hover(function(){
		$(this).addClass('hover');
		$(this).find("ul:first").fadeIn("fast");
	},function(){
		$(this).removeClass('hover');
		$(this).find("ul:first").fadeOut("fast");
	});


/*-------------accordion menu-----------*/
	$("#side_menu li").children("ul").parent("li").addClass("nxt_lvl");
	$("#side_menu li.active").children("ul").slideDown("fast");
	$('#side_menu li.nxt_lvl').append('<span class="dropdown"></span>');
	var currentListItem = $("#side_menu").find("li.active");
	$('#side_menu li > span.dropdown, #side_menu li > a ').click(function(){
		var newCurrentListItem = $(this).parent();																		  
		var currentDropDown = newCurrentListItem.children("ul");
		if (newCurrentListItem.is(currentListItem)) {
			$(currentListItem).removeClass("active");
			$(currentDropDown).slideUp("fast");
			currentListItem = null;
		} else {
			if ($(newCurrentListItem).hasClass('active')) 
				{
					$(currentDropDown).slideUp("fast");
					$(newCurrentListItem).removeClass("active");
				} 
				else 
				{
					currentDropDown.slideDown("fast");
					$(newCurrentListItem).siblings('li').add($(newCurrentListItem).find('li')).removeClass("active");
					currentListItem = newCurrentListItem;
					currentListItem.closest('ul').find('ul').not(currentDropDown).slideUp("fast");
					currentListItem.addClass("active");					
				}
		}
		if ($(newCurrentListItem).is('.nxt_lvl')) {return false;}
		});


/*-----------static-------------*/
	$("div.text").append("<div class='clear'></div>");
	
	$('.text table').wrap('<div class="table_box"></div>');
	$('.text .table_box').each(function(){
		  $(this).width($(this).find('table').width());
		});	
	
	$('tr:even').addClass('even');

/*jquery-ui*/	
	$('.spinner').spinner({min:0});
/*end */

	$('select').not('.dontchangethis').selectBox();

/*----jcarousel----------*/
	$('#jcarousel').jcarousel({
		'wrap':'circular'
	});	
	

	$('.item_det .sm_imgs li a').click(function(){
		var img_src=$(this).attr('href');
		$(this).closest('.fll').find('.big_img img').attr('src',img_src);
		return false;
	});	
	
/*--------cycle slider---------*/
    $('#slider').cycle({
        timeout: 3000,
		next:'#slider_next',
		prev:'#slider_prev'
    });	

/*-------------footer at the bottom----------*/
	var hh1 = $('.wrapper').height(); var hh2 = 0;
	function window_height() {
		hh2 = $(window).height();
		if ( hh2 > hh1 ) {
				hh2 = (hh2 - $('.header').outerHeight(true) - $('.footer ').outerHeight(true));
				$('.content').height(hh2);} 
			else{
				$('.content').css('height','auto');
			}; 	
	};
	window_height();
	$(window).resize(function() {window_height();});

});
