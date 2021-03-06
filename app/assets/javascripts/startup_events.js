// For navigation

(function ($) {
  $(document).ready(function () {
    bind_calendar_navigation();
    fix_heights();
  });

  $(window).resize(fix_heights);
  // ensure the columns are the right heights after the images load
  $(window).load(function () {
    fix_heights();
  });


  function bind_calendar_navigation() {
    $("#calendar_nav li").click(function() {
      var target_season_id = $(this).data("season-id");

      $('#calendar_nav li').removeClass('selected');
      $(this).addClass('selected');

      $('.season_day_box').hide();
      setTimeout(function () {
        $('#calendar-season-' + target_season_id).fadeIn("fast", function () {
          fix_heights();
        });
      }, 10)
    });
    $("#calendar_nav li.selected").click();
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
