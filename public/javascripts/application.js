$(document).ready(function(){
  // alert('Locked and loaded!');
  // Initializes ajaxForm
  ajaxifyForm('#shipForm');
  // Initializes slider funtions on all lists in td.slider...
  sliders('.slider select');
  configurationSelect();

});


// Calls the slider UI plugin and sets the onchange function.
function sliders(selector){
  $(selector).each(function(){
    $(this)
      .selectToUISlider({
        labels: 2,
        sliderOptions: {change: function(){
          var $form = $('#shipForm'), url = $form.attr('action') + '.js'
          $form.ajaxSubmit({ url: url, target: '#ship'});
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

function configurationSelect(){
  var $config = $('#ship_configuration_id'),
    configurations = $config.find('option');
  $config.hide();
  configurations.each(function(){
    if($(this).attr('selected')){
      boxClass = 'selected config';
    }else{
      boxClass = 'config';
    }
    var boxId = $(this).text(),
      box = "<a title='" + boxId + "' class='" + boxClass + "' id='" + boxId + "'></a>"
    $config.before(box);
  });
  var boxes = $('a.config')
  boxes.each(function(){
    $(this).click(function(){
      boxes.removeClass('selected');
      $(this).addClass('selected');
      var selectedId = $(this).attr('id');
      configurations.each(function(){
        if($(this).text() == selectedId){
          $(this).attr('selected', true);
        }else{
          $(this).attr('selected', false);
        }
      });
      submitForm('#shipForm');
    });
  });
}


