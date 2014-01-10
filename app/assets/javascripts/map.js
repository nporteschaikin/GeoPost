_.map = {
  
  _el: {
    parent: 'div.map'
  },
  
  _attr: {
    map: 'map'
  },
  
  init: function () {
    _.map.bind();
  },
  
  construct: function () {
    _.$('map/parent').each(_.map.install);
  },
  
  install: function () {
    if ($(this).data(_.map._attr.map)) return false;
    if (!$(this).attr('id')) $(this).attr('id', 'map' + Math.floor((Math.random()*1000)))
    var map = L.map($(this).attr('id')).setView([51.505, -0.09], 13);
    L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);
  },
  
  bind: function () {
    
  }
  
}

$(document).on('load', _.map.init);
$(document).on('construct', _.map.construct);