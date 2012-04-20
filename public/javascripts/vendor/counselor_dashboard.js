$(function(){
  var $section = $("section#counselor_dashboard");
  $section.find("fieldset.times.current").each(function(i) {
    var $e = $(this),
        $p = $e.find("p:first"),
        idx = $e.siblings("fieldset.times.current").andSelf().index($e),
        $link = $e.closest("form").find("ul.weekdays.current a").eq(idx);
    if (i) {
      $e.hide();
    }
    $p.text($p.text() + " " + $link.find("h4").attr("title"));
  });
  
  $section.find("fieldset.times.next").each(function(i) {
    var $e = $(this),
        $p = $e.find("p:first"),
        idx = $e.siblings("fieldset.times.next").andSelf().index($e),
        $link = $e.closest("form").find("ul.weekdays.next a").eq(idx);
    if (i) {
      $e.hide();
    }
    $p.text($p.text() + " " + $link.find("h4").attr("title"));
  });

  $section.find("ul.weekdays a").click(function() {
    var $e = $(this),
        idx = $e.closest("ul").find("a").index($e);
    $("ul.weekdays").find("li").removeClass("active")
    $e.closest("li").addClass("active");
    return false;
  });

  $section.find("ul.weekdays.current a").click(function() {
	$("fieldset.times.current").show();
	$("fieldset.times.next").hide();
    var $e = $(this),
        idx = $e.closest("ul").find("a").index($e);
    $e.closest("form").find("fieldset.times.current").hide().eq(idx).show();
    return false;
  });

  $section.find("ul.weekdays.next a").click(function() {
	$("fieldset.times.current").hide();
	$("fieldset.times.next").show();
    var $e = $(this),
        idx = $e.closest("ul").find("a").index($e);
    $e.closest("form").find("fieldset.times.next").hide().eq(idx).show();
    return false;
  });

  // $section.find("fieldset.times.current input").change(function() {
  //   var $e = $(this),
  //       $inputs = $e.closest("ul").find("input:checked");
  //   $e.closest("li").toggleClass("checked");
  //   $section.find("ul.weekdays.current li.active h4 span").text($inputs.length);
  // });

  // $section.find("fieldset.times.next input").change(function() {
  //   var $e = $(this),
  //       $inputs = $e.closest("ul").find("input:checked");
  //   $e.closest("li").toggleClass("checked");
  //   $section.find("ul.weekdays.next li.active h4 span").text($inputs.length);
  // });

  $section.find("a.clear").click(function() {
    $(this).closest("fieldset").find("li.checked").removeClass("checked").find("input").trigger("click");
    $section.find("ul.weekdays li.active h4 span").text(0);
    return false;
  });
});
