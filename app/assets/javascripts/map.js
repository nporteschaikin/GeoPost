var Map = function ($element) {
  
  var id;
  id  =  $element.attr('id');
  
  this.element = $element;
  
  if (!id) {
    id = 'Map' + Math.ceil((Math.random() * 1000));
    $element.attr('id', id);
  }
  
  this.object = L.mapbox.map(id, 'nporteschaikin.hi95jbe4');
  
}

Map.prototype.marker = function (geojson) {
  
  L
    .mapbox
    .featureLayer()
    .loadURL(geojson)
    .addTo(this.object);
  
}