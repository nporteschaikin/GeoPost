_.app = {

  _el: {
    parent: ".App",
    module: "> div",
    nav: "> nav",
    link: "a[data-app]",
    active: '.active'
  },

  init: function () {
    _.app.bind();
  },

  click: function (e) {
    e.preventDefault();

    var url = $(this).attr('href');

    _.$('app/parent', 'app/link').not($(this)).removeClass(_.c('app/active'));
    $(this).addClass(_.c('app/active'));

    _.app.open(url);

  },

  open: function (url) {
    _.$('app/parent', 'app/module').load(url, _.app.after);
  },

  after: function () {
    console.log('loaded');
  },

  bind: function () {
    console.log('binding');
    $(document).on('click', _.e('app/parent', 'app/link'), _.app.click);
  }

}

$(document).on('load', _.app.init);
