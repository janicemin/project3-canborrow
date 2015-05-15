// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui.min
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(function() {
		var params = {};

    $( ".draggable" ).draggable({ 
    	snap: true,
    	drag: function() {
        params = {
        	id: $(this).data('garmentId'),
					profileID: $(this).data('profileId'),
					name: $(this).data('name')
				};      
			}
   	});

    $( ".column-style" ).droppable({
      activeClass: "ui-state-default",
      hoverClass: "ui-state-hover",
      drop: function( event, ui ) {
      	var profileID = $('#garment').data('profile-id');
        params.method = "update";
      	$.ajax({
      		method: "get",
      		url:"/closets/update/" + profileID,
      		data: $.param(params)
     		});
        // console.log('hi');
        // console.log($(this).data('index'));
      }
    });
 });
