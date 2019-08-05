$( function() {
  
  $("#price_form").on("keyup", function(e) {
    e.preventDefault();
    $("#fee_column").text("-");
    $("#benefit_column").text("-");
    var input = $(this).val();
    if (input >= 300 && 9999999 >= input ) {
      var sellFee = Math.floor(input / 10);
      var benefit = (input - sellFee);
      var feePre = sellFee.toLocaleString();
      $("#fee_column").text("¥" + feePre);
      var benefitPre = benefit.toLocaleString();
      $("#benefit_column").text("¥" + benefitPre);
    }
  })
})