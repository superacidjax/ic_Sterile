function stripeResponseHandler(status, response) {
  if (response.error) {
    // re-enable the submit button
    $('form fieldset.actions input').removeAttr("disabled");

    // show the errors on the form
    $(".payment-errors").html(response.error.message);
  } else {
    var form$ = $("form");

    // token contains id, last4, and card type
    var token = response['id'];

    // insert the token into the form so it gets submitted to the server
    form$.append("<input type='hidden' name='stripeToken' value='" + token + "' />");

    // and submit
    form$.get(0).submit();
  }
}

$(document).ready(function() {
  $('form').submit(function(event) {
    console.log("submitting form with stripe");

    // disable the submit button to prevent repeated clicks
    $('form fieldset.actions input').attr("disabled", "disabled");

    // createToken returns immediately - the supplied callback submits the form if there are no errors
    Stripe.createToken({
        number: $('.card-number').val(),
        cvc: $('.card-cvc').val(),
        exp_month: $('.card-expiry-month').val(),
        exp_year: $('.card-expiry-year').val()
    }, stripeResponseHandler);

    return false; // submit from callback
  });
});
