// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//=require jquery.pjax
//= require materialize-sprockets
//= require soundmanager2
//= require bar-ui
//=require social-share-button
//=require rails.validations 



$( document ).ready(function() {
$(".button-collapse").sideNav();
$('ul.tabs').tabs();
$('select').material_select();    
$('.modal-trigger').leanModal(); 
$('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });
$('.parallax').parallax();

});

$(document).ready(function () {
  $('.pagination .previous_page').html('<i class="material-icons">chevron_left</i>');
  $('.pagination .next_page').html('<i class="material-icons">chevron_right</i>');

  $('.pagination').each(function () {
    var $bar = $(this);
    $bar.find('a, .current, span').wrapAll('<ul class="pagination">');
    $bar.find('a, .current, span').wrap('<li class="waves-effect">');

    $bar.find('em').each(function () {
      $(this).parent().addClass('disabled orange accent-5');
      $(this).replaceWith('<a href="#">' + $(this).text() + '</a>');
    });
  });

    var options = [
    {selector: '#brand', offset: 200, callback: 'Materialize.fadeInImage("#brand")' },
    {selector: '#brandMobile', offset: 200, callback: 'Materialize.fadeInImage("#brandMobile")' }
  ];
  Materialize.scrollFire(options);

});

$(function() {
  $(document).pjax('a:not([data-remote]):not([data-behavior]):not([data-skip-pjax])', '[data-pjax-container]')
});

// $(document).on('submit', 'form#search_filter', function(event) {
//   $.pjax.submit(event, '#search_filter')
// })



          
