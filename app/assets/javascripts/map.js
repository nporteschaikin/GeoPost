function M (selector, bounds, icon) {
  this.el         =   $(selector);
  this.bounds     =   bounds;
  this.setId();
  this.setMap();
  if (icon) this.setIcon(icon);
  return this;
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
      layer =   new L.TileLayer (url, {attribution: attr });
      
  // set bounds
  this.object
    .fitBounds([
      [this.bounds[0], this.bounds[1]],
      [this.bounds[2], this.bounds[3]]
    ]);
  
  // add tile layer to object
  this.object
    .addLayer(layer);
  
}

M.prototype.setIcon = function (url) {
  this.icon   =   L.icon({iconUrl: url});
  return this.icon;
}

M.prototype.addPlace = function(latlng) {
  // currently just a namespace
  this.addMarker(latlng);
}

M.prototype.addMarker = function (latlng) {
  if (!this.icon) return false;
  L.marker(latlng, {icon: this.icon}).addTo(this.object);
}