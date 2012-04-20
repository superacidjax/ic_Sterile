$(function() {
  $('select.country').change(function() {
    var $e = $(this),
        $f = $e.closest("form"),
        is_us = $e.val() === "US";
    $f.find('.state').toggle(is_us).attr("disabled", !is_us);
    $f.find('.province').toggle(!is_us).attr("disabled", is_us);
  }).change();

  (function($sign_up) {
    $sign_up.find("dd").each(function() {
      var $dd = $(this);
      $dd.find(":radio").change(function() {
        $dd.find(".details").toggle($dd.find("li:eq(1) :radio").is(":checked"));
      }).change();
    });
  })($("#sign_up"));

});
