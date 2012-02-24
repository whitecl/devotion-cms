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
