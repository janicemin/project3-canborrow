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
//= require materialize-sprockets
//= require_tree .


$(function() {
		var params = {};

		$( ".draggable" ).draggable({ 
			snap: true,
			drag: function() {
				params = {
					closet: {
						profile_id: $('#garment').data('profile-id'),
						name: $(this).data('closet'),
						garment_id: $(this).data('garment-id')
					}
				};
			}
		});

		$( ".column-style" ).droppable({
			activeClass: "ui-state-default",
			hoverClass: "ui-state-hover",
			drop: function( event, ui ) {
				var $drag = $(this),
						profileID = $('#garment').data('profile-id');

				$.ajax({
					method: "post",
					url: '/closets/'+profileID+'/update/',
					data: $.param(params)
				}).done(function(response, status, request){
  console.dir(request);
});
			}
		});
 });
