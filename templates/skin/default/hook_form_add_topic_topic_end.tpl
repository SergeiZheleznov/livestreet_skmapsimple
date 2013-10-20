<script>
	$(function () {

		var map;
		var marker;

		var c =new google.maps.LatLng({if $_aRequest['topic_skmapcord']}{$_aRequest['topic_skmapcord']}{else}{cfg name="plugin.skmapsimple.default_coord"}{/if});

		function placeMarker(location) {
			if ( marker ) {
				marker.setPosition(location);
			} else {
				marker = new google.maps.Marker({
					position: location,
					map: map,
					draggable:true,
					icon: '{$aTemplateWebPathPlugin.skmapsimple}/images/marker.png?v=8',
					shadow: '{$aTemplateWebPathPlugin.skmapsimple}/images/marker.shadow.png?v=8'
				});
			   	google.maps.event.addListener(marker, "dragend", function(event) {
					placeMarker(event.latLng);
					$('#topic_skmapcord').val(event.latLng);
	        	});
			}
		}

		function initialize() {
			var mapOptions = {
				zoom: 8,
				center: c,
				mapTypeId: google.maps.MapTypeId.ROADMAP,
				disableDefaultUI: true,
				mapTypeControl: true,
				scaleControl: true,
				zoomControl: true
			};
			map = new google.maps.Map(document.getElementById('skmapsimple-map-canvas'),mapOptions);

			{if $_aRequest['topic_skmapcord']}
				placeMarker(c);
			{/if}

			google.maps.event.addListener(map, 'click', function(event) {
				placeMarker(event.latLng);
				$('#topic_skmapcord').val(event.latLng);
			});

			{if $_aRequest['topic_skmapcord']}
	   			google.maps.event.addListener(marker, "dragend", function(event) {
					placeMarker(event.latLng);
					$('#topic_skmapcord').val(event.latLng);
	        	});
        	{/if}

		}

		$("#topic_skmapcord").click(function () {
			if ($(this).is(':checked')) {
	            $('#skmapsimple-map-wrapper').slideDown(300, function(){
	                google.maps.event.trigger(map, "resize");
	                map.setCenter(c);
	            });
				$('#topic_skmapinfo').show();
			} else {
				$('#skmapsimple-map-wrapper').slideUp();
				$('#topic_skmapcord').val('');
				$('#topic_skmapinfo').hide();
			}
        });

		google.maps.event.addDomListener(window, 'load', initialize);
	});

</script>
<p>
	<label><input type="checkbox" id="topic_skmapcord" name="topic_skmapcord" class="input-checkbox" value="{$_aRequest['topic_skmapcord']}" {if $_aRequest['topic_skmapcord']}checked="checked"{/if}>{$aLang.plugin.skmapsimple.checkbox_title}</label>
	<small class="note">{$aLang.plugin.skmapsimple.checkbox_note}</small>

	<div id="skmapsimple-map-wrapper"{if !$_aRequest['topic_skmapcord']} style="display:none;"{/if}>
	   	<div id="skmapsimple-map-canvas" style="height:300px; margin:7px 0 0 0"></div>
	</div>

	<p id="topic_skmapinfo" {if !$_aRequest['topic_skmapcord']} style="display:none;"{/if}><label for="topic_skmapinfo">{$aLang.plugin.skmapsimple.infomessage_title}</label>
	<input type="text" class="input-text input-width-full" id="page_seo_keywords" name="topic_skmapinfo" value="{$_aRequest['topic_skmapinfo']}" class="input-wide" />
	<span class="note">{$aLang.plugin.skmapsimple.infomessage_note}</span></p>
</p>