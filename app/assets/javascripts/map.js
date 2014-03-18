var Map = function ($element) {
  
  var id, object, featureLayer;
  id  =  $element.attr('id');
  
  this.element = $element;
  
  if (!id) {
    id = 'Map' + Math.ceil((Math.random() * 1000));
    $element.attr('id', id);
  }
  
  object = L
    .mapbox
    .map(id, 'nporteschaikin.hi95jbe4');
  
  if ($element.data('geojson')) {
    
    featureLayer = L
      .mapbox
      .featureLayer()
      .loadURL($element.data('geojson'))
      .addTo(object);
      
    featureLayer.on('ready',
      function () {
        // object.fitBounds(featureLayer.getBounds());
      }
    )
  }
  
}