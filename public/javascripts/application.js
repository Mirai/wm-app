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

function remove_fields(link, class) {  
	$(link).prev("input[type=hidden]").val("1");  
    $(link).closest("." + class).hide();  
}

function add_fields(link, association, content) {  
    var new_id = new Date().getTime();  
    var regexp = new RegExp("new_" + association, "g");  
    $(link).parent().before(content.replace(regexp, new_id));  
}

$(document).ready(function() {	
	//show and hide the extra ranged weapon fields
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
	
	
	//when the new weapon form is submitted on the unit page
	$('#x_newweapon').each(function() {
		$('#new_weapon').live('submit', function() {
			$.post($(this).attr('action'), $(this).serialize(), null, "script");
			return false;
		})
		
		$('#cancel').live('click', function() {
			$('#x_newweapon').html('');
		})
	})

	//when the new spell form is submitted on the unit page
	$('#x_newspell').each(function() {
		$('#new_spell').live('submit', function() {
			$.post($(this).attr('action'), $(this).serialize(), null, "script");
			return false;
		})
		
		$('#cancel').live('click', function() {
			$('#x_newspell').html('');
		})
	})
	
	//when add spell or add weapon submitted on unit page
	$('.unit_addition').submit(function() {
		$.post($(this).attr('action'), $(this).serialize(), null, "script");
		return false;
	})
	
	//when remove spell or weapon link is clicked
	$('.remove').live('click', function() {
		$.get($(this).attr('href'), null, null, "script");
		return false;
	})
	
	$('.remove').live('click', function() {
		$(this).parent().remove();
	})
	
	// show damage grid based on select
	$('#unit_warjack_attributes_damage_grid_id').change(function() {
		$.get('/damage_grids?id=' + $(this).val());
		return false;
	})
	$('#unit_warjack_attributes_damage_grid_id').trigger('change')
	
	// order dropdown
	$('.order_select').live('change', function() {
		/*var optionsArr = "<option value=''>No parent</option>";
		
		$('.order_select option:selected').each(function () {
			optionsArr += "<option value='" + $(this).val() + "'>" + $(this).text() + "</option>\n";
		})
		
		$('.parent_select').html(optionsArr)*/
		
		var option = "<option value='" + $(this).val() + "'>" + $(this).children(":selected").text() + "</option>";
		$('.parent_select').append(option);
	})
		
	$(function() { $('a[rel=updater]').ajaxUpdater() })
});