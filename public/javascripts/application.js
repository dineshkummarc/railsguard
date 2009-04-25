$(document).ready(function(){
  // alert('Locked and loaded!');
  $('.slider select').each(function(){
    $(this)
      .selectToUISlider({
        sliderOptions: {change: function(){}}
      })
      .hide();
  })
});
