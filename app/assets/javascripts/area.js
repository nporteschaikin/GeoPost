_.area = {

  _el: {
    parent: '.Area',
    map: '.Map'
  },
  
  construct: function () {
    
    var map;
    map   = new Map(_.$('area/parent', 'area/map'));
    
  }

}

$(document).on('construct', _.area.construct);
