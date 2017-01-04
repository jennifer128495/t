// See post: http://asmaloney.com/2015/06/code/clustering-markers-on-leaflet-maps


var map = L.map( 'map', {
  center: [36.82, -98.58],
  minZoom: 2,
  zoom: 4
});

L.tileLayer( 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
 attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
 subdomains: ['a','b','c']
}).addTo( map );

var myURL = jQuery( 'script[src$="leaflets.js"]' ).attr( 'src' ).replace( 'leaflets.js', '' );

var myIcon = L.icon({
  iconUrl: myURL + 'images/pin24_building.png',
  iconRetinaUrl: myURL + 'images/pin48_building.png',
  iconSize: [29, 24],
  iconAnchor: [9, 21],
  popupAnchor: [0, -14]
});

var markerClusters = L.markerClusterGroup({
    spiderfyOnMaxZoom: true,
    showCoverageOnHover: false
});

var ourCustomControl = L.Control.extend({
  options: {
    position: 'topleft' 
  },
  onAdd: function (map) {
    var container = L.DomUtil.create('div', 'leaflet-bar leaflet-control leaflet-control-custom');

    container.style.backgroundColor = 'white';
    container.style.backgroundImage = "url(" + myURL + "images/unlink.png)";
    container.style.backgroundSize = "30px 30px";
    container.style.width = '30px';
    container.style.height = '30px';

    container.onclick = function(){
      container.style.backgroundImage = "url(" + myURL + "images/link.png)";
    }
    return container;
  },

});
map.addControl(new ourCustomControl());


for ( var i = 0; i < markers.length; ++i )
{
  var popup = '<b>' + markers[i].name + '</b>' +
              '<br/><b>Business Type:</b> ' + markers[i].name +
              '<br/><b>Building Area:</b> ' + Math.round( markers[i].lat ) +
              '<br/><b>Energy Usage:</b> ' + Math.round( markers[i].alt * 0.3048 ) + ' kWh' +
              '<br/><b>Location:</b> ' + markers[i].city +
              '<br/><br/><b>Click to view <a href=>building detail </a></b>';

  var m = L.marker( [markers[i].lat, markers[i].lng], {icon: myIcon, title: markers[i].name} )
                  .bindPopup( popup );

  markerClusters.addLayer( m );
}




map.addLayer( markerClusters );
