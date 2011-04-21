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
		$($dom_id).append('<a id="cancel" href="javascript:void()">Cancel</a>')
      })
    })
  })
}


$(document).ready(function() {	
	if($('#weapon_ranged').is(':checked')) {
		$('#ranged_fields').css('display', 'block');
	}
	
	$('#weapon_ranged').live('click', function() {		
		if($(this).is(':checked')) {
			$('#ranged_fields').show("fast");
		} else {
			$('#ranged_fields').hide("fast");
		}
	})
	
	$('#x_newweapon').each(function() {
		$('#new_weapon').live('submit', function() {
			$.post($(this).attr('action'), $(this).serialize(), null, "script");
			return false;
		})
		
		$('#cancel').live('click', function() {
			$('#x_newweapon').html('');
		})
	})

	$('#x_newspell').each(function() {
		$('#new_spell').live('submit', function() {
			$.post($(this).attr('action'), $(this).serialize(), null, "script");
			return false;
		})
		
		$('#cancel').live('click', function() {
			$('#x_newspell').html('');
		})
	})
	
	$('#unit_unit_type_id').change(function() {
		$.get($(location).attr('href') + '?unit_type=' + $(this).val(), null, null, "script");
		return false;
	})
	$('#unit_unit_type_id').trigger('change');
		
	$(function() { $('a[rel=updater]').ajaxUpdater() })
});