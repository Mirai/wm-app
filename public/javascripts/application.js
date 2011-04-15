// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
	//$('#extra').css('display','none');
	
	$('#weapon_ranged').click(function() {
		if($('#weapon_ranged').is(':checked')) {
			$('#extra').html("");
		} else {
			$('#extra').html("<%= render 'ranged_form' %>");
		}
	})
});