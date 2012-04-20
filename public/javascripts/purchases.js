$(function() {
  (function($forms) {
    $forms.submit(function() {
      var processing = false;
      $forms.each(function() {
        if ($(this).data("processing")) { processing = true; }
      });
      var $new_pmnt = $("form#new_payment_notification"),
          $f = $(this);
      if ($f.data("submit")) { return true; }
      if (processing) { return false; }
      else { $f.data("processing", true); }
      $.ajax({
        url: $new_pmnt.attr("action"),
        data: $new_pmnt.serialize(),
        type: $new_pmnt.attr("method"),
        success: function() {
          $f.data("submit", true).removeData("processing").submit();
        },
        error: function(xhr) {
          alert("Something went wrong! Please try again.");
          $f.removeData("processing");
        }
      });
      return false;
    });
  })($("#purchase ul form"));
});
