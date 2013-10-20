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
				    scrollwheel: false,
					zoomControl: true
				};

				map{$oTopic->getId()} = new google.maps.Map(document.getElementById('skmapsimple-map-canvas-{$oTopic->getId()}'),mapOptions{$oTopic->getId()});

				marker{$oTopic->getId()} = new google.maps.Marker({
					position: new google.maps.LatLng({$oTopic->getSkmapcoord()}),
					map: map{$oTopic->getId()},
					icon: '{$aTemplateWebPathPlugin.skmapsimple}/images/marker.png?v=5',
					shadow: '{$aTemplateWebPathPlugin.skmapsimple}/images/marker.shadow.png?v=5',
					{if $oTopic->getInfotitle()}
					title: '{$oTopic->getInfotitle()}'
					{/if}
				});

				{if $oTopic->getInfomessage()}
				infoWindow{$oTopic->getId()} = new google.maps.InfoWindow({
					content: '{$oTopic->getInfomessage()}',
					maxWidth: 300
				});

				google.maps.event.addListener(marker{$oTopic->getId()}, 'click', function () {
					infoWindow{$oTopic->getId()}.open(map{$oTopic->getId()}, marker{$oTopic->getId()});
				});
				{/if}
			});

		</script>

		<a name="map"></a>
		<div>
		    <div id="skmapsimple-map-canvas-{$oTopic->getId()}" style="height:300px"></div>
		</div>
	{/if}

{else}
	<blockquote>{$aLang.plugin.skmapsimple.access_denied}</blockquote>
{/if}