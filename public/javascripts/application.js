// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

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
});