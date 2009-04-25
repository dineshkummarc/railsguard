$(document).ready(function(){
  // alert('Locked and loaded!');
  // Initializes ajaxForm
  ajaxifyForm('#shipForm');
  // Initializes slider funtions on all lists in td.slider...
  sliders('.slider select');

});


// Calls the slider UI plugin and sets the onchange function.
function sliders(selector){
  $(selector).each(function(){
    $(this)
      .selectToUISlider({
        sliderOptions: {change: function(){
          var $form = $('#shipForm'),
            url = $form.attr('action') + '.js'
          // alert(url)
          $form.ajaxSubmit({ 
            url:    url,
            target: '#ship'
          });
        }}
      })
      .hide();
  }); 
}

function submitForm(selector){
  var $form = $(selector),
    url = $form.attr('action') + '.js'
  $form.ajaxSubmit({ 
    url:    url,
    target: '#ship'
  });
}

// Ajaxifies main editing form, so that the independant options are updated in real time. 
function ajaxifyForm(selector){
  var $form = $(selector),
    url = $form.attr('action') + '.js'
  $form.ajaxForm({ 
    url:    url,
    target: '#ship'
  });
}


