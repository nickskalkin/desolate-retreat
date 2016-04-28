$(function(){

  if ($('#osago_calculator_drivers_count').val() == 'drivers_limited') {
    hideDriverExperience();
  }

  function showDriverExperience() {
    $('.osago_calculator_driver_experience').show();
  }

  function hideDriverExperience() {
    $('.osago_calculator_driver_experience').hide();
    $('#osago_calculator_driver_experience').val('not_setted_up');
  }

  $('#osago_calculator_drivers_count').change(function(){
    if ($(this).val() == 'drivers_limited') {
      hideDriverExperience();
    } else {
      showDriverExperience();
    }
  });
});
