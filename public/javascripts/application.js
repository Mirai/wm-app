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
		$($dom_id).children().find('input').not(':hidden').first().focus()
		$($dom_id).append('<a id="cancel" href="javascript:void()">Cancel</a>')
      })
    })
  })
}

function remove_fields(link, css_class) {
	$(link).prev("input[type=hidden]").val("1");
    $(link).closest("." + css_class).hide();
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


	//when the new weapon form is submitted on the model page
	$('#x_newweapon').each(function() {
		$('#new_weapon').live('submit', function() {
			$.post($(this).attr('action'), $(this).serialize(), null, "script");
			return false;
		})

		$('#cancel').live('click', function() {
			$('#x_newweapon').html('');
		})
	})

	//when the new spell form is submitted on the model page
	$('#x_newspell').each(function() {
		$('#new_spell').live('submit', function() {
			$.post($(this).attr('action'), $(this).serialize(), null, "script");
			return false;
		})

		$('#cancel').live('click', function() {
			$('#x_newspell').html('');
		})
	})

	$('#x_neworder #new_order').live('submit', function() {
		$('#add_order a').trigger('click')
		$.post($(this).attr('action'), $(this).serialize(), null, "script");
		return false;
	})

	$('#x_neworder #cancel').live('click', function() {
		$('#x_neworder').html('');
	})

	$('#x_newtrait #new_trait').live('submit', function() {
		$.post($(this).attr('action'), $(this).serialize(), null, "script");
		return false;
	})

	$('#x_newtrait #cancel').live('click', function() {
		$('#x_newtrait').html('');
	})

	//when add spell or add weapon submitted on model page
	$('.model_addition').submit(function() {
		$.post($(this).attr('action'), $(this).serialize(), null, "script");
		return false;
	})

	//when remove spell or weapon link is clicked
	$('.weapon_stats .remove, .stat_table .remove').live('click', function() {
		$.get($(this).attr('href'), null, null, "script");
		return false;
	})

  $('.order_fields .remove').live('click', function() {
    $.get("remove_order/" + $(this).siblings(".order_select").val(), null, null, "script")
    $(this).parents(".order_fields").next().remove();
    $(this).parents(".order_fields").remove();
    return false;
  })

	// show damage grid based on select
	$('#model_warjack_attributes_damage_grid_id').change(function() {
		$.get('/damage_grids?id=' + $(this).val());
		return false;
	})
	$('#model_warjack_attributes_damage_grid_id').trigger('change')

	$('#add_order a').click(function() {
		$('.order_select').trigger('change');
	})

	$('.attachment_check').change(function() {
		$('.attachment_check').is(':checked') ? $('#attachment_field').show("fast") : $('#attachment_field').hide("fast");
	})
	$('.attachment_check').trigger('change')

	$("#model_faction_id").change(function() {
	  if($(this).val() == 6 || $(this).val() == 11) {
	    $("#mercenary_select").removeClass("hidden");
	  } else {
	    $("#mercenary_select").addClass("hidden");
	  }
	});
	$("#model_faction_id").trigger("change");

	$(function() { $('a[rel=updater]').ajaxUpdater() })
});