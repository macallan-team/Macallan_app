// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require cocoon
//= require_tree .

document.addEventListener("turbolinks:load", function() {

	$('html').removeClass("no-scroll");
	$('.alert').fadeIn("slow", function () {
		$(this).delay(3000).fadeOut("slow");
	  });
	$('#menu').on('click', function(){
		$('html').animate({scrollTop: 0},50,function(){
			$('.menu-box').fadeToggle();
			$('#menu').toggleClass("open");
			$('html').toggleClass("no-scroll");
			$('#scroll-button').fadeOut(300);
		});
		event.stopPropagation();
	});
	$('.menu-box').on('click', function(){
		if ($('.menu-box').is('visible')) {
			event.stopPropagation();
		}else{
		}
	});

	$('header').on('click', function(){
		if ($('.menu-box').is(':visible')) {
			$('.menu-box').fadeToggle();
			$('#menu').toggleClass("open");
			$('html').toggleClass("no-scroll");
			event.preventDefault();
		}else{
		}
	});

	var startPos = 0,winScrollTop = 0;
	$(window).on('scroll',function(){
		winScrollTop = $(this).scrollTop();
		if (winScrollTop >= startPos) {
			$('#scroll-button').hide();
		} else {
			$('#scroll-button').show();
		}
		startPos = winScrollTop;
	});

	$('#scroll-button').on('click', function(){
		$('html').animate({scrollTop: 0},300,function(){
			$('#scroll-button').fadeOut(300);
		});
	});
});
