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

    $("ul.season_day_box").each(function() {
      var $this = $(this);
      var days = $this.children("li");
      if (days.length) {
        var rows = Math.ceil(days.length / 7);
        $this.height((rows * $(days[0]).outerHeight()) + 'px');
      }
    });
  }
})(jQuery);
