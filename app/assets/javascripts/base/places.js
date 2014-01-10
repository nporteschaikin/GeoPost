var _ = {
  
  $: function () {
    return $(_.j(arguments));
  },
  
  e: function () {
    return _.j(arguments);
  },
  
  j: function (arguments) {
    
    var args = Array.prototype.slice.call(arguments),
    arr = [],
    selector;
    
    for (var x=0; x < args.length; x++) {
      selector = args[x].split('/');
      arr.push(_[selector[0]]['_el'][selector[1]]);
    }
    
    return arr.join(' ');
    
  },
  
  c: function () {
    return _.j(arguments).substring(1);
  }
  
};

$(ready);

function ready () {
  $(document).trigger('load');
  $(document).trigger('construct');
}