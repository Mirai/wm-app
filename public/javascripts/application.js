// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery.ajaxSetup({  
	'beforeSend': function (xhr) {xhr.setRequestHeader("Accept", "text/javascript")}  
});

$.fn.ajaxUpdater = function(options) {
  var options = $.extend({
    prefix: 'x'
  }, options || {})

  return this.each(function() {
    $(this).click(function(e) {
      e.preventDefault()

      var $dom_id = ['#', options.prefix, '_', $(this).attr('id')].join('')

      $.get(this.href, function(data) {
        $($dom_id).html(data)
      })
    })
  })
}


$(document).ready(function() {
	if($('#weapon_ranged').is(':checked')) {
		// nothing
	} else {
		$('#ranged_fields').css('display', 'none');
	}
	//$('#weapon_ranged:not(:checked)').css('display', 'none');
	
	$('#weapon_ranged').click(function() {		
		if($('#weapon_ranged').is(':checked')) {
			$('#ranged_fields').show("fast");
		} else {
			$('#ranged_fields').hide("fast");
		}
	})
	
	$(function() { $('a[rel=updater]').ajaxUpdater() })
	
	$('#x_addspell').contents(function() {
		$('#new_spell').submit(function() {
			//$.post($(this).attr('action'), $(this).serialize(), null, "script");
			//return false;
			alert("test");
		})
	})
});