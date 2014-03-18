function Map ($object) {
  
  var id;
  id  =  $object.attr('id');
  
  this.object = $object;
  
  if (!id) {
    id = Math.ceil((Math.random() * 1000));
    $object.attr('id', 'Map' + id);
  }
  
  L.mapbox.map(id, 'nporteschaikin.hi9a4jdb');
  
}