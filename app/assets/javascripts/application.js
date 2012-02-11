// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require days
//= require devotions
//= require rich
//= require jquery.equalheights

// For navigation

(function ($) {
  $(document).ready(function () {
    bind_calendar_navigation();
    fix_heights();
  });

  $(window).resize(fix_heights);

  function bind_calendar_navigation() {
    $("#calendar_nav li").click(function() {
      var target_season_id = $(this).data("season-id");

      $('#calendar_nav li').removeClass('selected');
      $(this).addClass('selected');

      $('.season_day_box').hide();
      $('#calendar-season-' + target_season_id).fadeIn();
    });
  }

  function fix_heights() {
    $("#subcontainer > div").equalHeights($(window).innerHeight());
  }
})(jQuery);
