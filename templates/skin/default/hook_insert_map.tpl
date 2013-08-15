{if $bShowMap}
	{if $oTopic->getSkmapcoord()}
		<script>
			var map{$oTopic->getId()};
			var marker{$oTopic->getId()};

			google.maps.event.addDomListener(window, 'load', function(){
				var mapOptions{$oTopic->getId()} = {
					zoom: 8,
					center: new google.maps.LatLng({$oTopic->getSkmapcoord()}),
					mapTypeId: google.maps.MapTypeId.ROADMAP,
				    disableDefaultUI: true,
				    mapTypeControl: true,
				    scaleControl: true,
				    zoomControl: true
				};

				map{$oTopic->getId()} = new google.maps.Map(document.getElementById('skmapsimple-map-canvas-{$oTopic->getId()}'),mapOptions{$oTopic->getId()});

				marker{$oTopic->getId()} = new google.maps.Marker({
					position: new google.maps.LatLng({$oTopic->getSkmapcoord()}),
					map: map{$oTopic->getId()},
					icon: '{$aTemplateWebPathPlugin.skmapsimple}/images/marker.png?v=5',
					shadow: '{$aTemplateWebPathPlugin.skmapsimple}/images/marker.shadow.png?v=5'
				});
			});

		</script>

		<div>
		    <div id="skmapsimple-map-canvas-{$oTopic->getId()}" style="height:300px"></div>
		</div>
	{/if}

{else}
	<blockquote>{$aLang.plugin.skmapsimple.access_denied}</blockquote>
{/if}