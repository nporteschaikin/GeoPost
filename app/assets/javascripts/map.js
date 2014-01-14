function M (selector, bounds) {
  this.el         =   $(selector);
  this.bounds     =   bounds;
  this.setId();
  this.setMap();
}

M.prototype.setId = function () {
  
  var id      =   this.el.attr('id');
  if (!id) id =   'M' + Math.floor((Math.random() * 1000));
  
  this.id     =   id;
  this.el.attr('id', id);
  
}

M.prototype.setMap = function () {
  
  // create object
  this.object   =   new L.Map(this.id);
  
  // create tile layer
  var url   =   'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
      attr  =   'Map data © OpenStreetMap contributors',
      layer =   new L.TileLayer (url, { minZoom: 8, maxZoom: 12, attribution: attr } );
  
  // add tile layer to object
  this.object
    .addLayer(layer);
  
}