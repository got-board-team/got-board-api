import Ember from 'ember';

export default Ember.Route.extend({
  model: function( params ) {
    //return this.storage.find(App.Match, params.id);
    var unit1 = {
      type: "footmen",
      position: { x: 0, y: 0 },
      territory: "winterfell",
    };
    var unit2 = {
      type: "knight",
      territory: "castle-black",
      position: { x: 0, y: 0 },
    };
    var match = {
      houses: {
        units: [ unit1, unit2],
      },
    };
    return match;
  },
  setupController: function(controller, match) {
    controller.set('model', match);
  },
  activate: function() {
    var calcPos = function (elm, pos, diff) {
      var posPx = $(elm).css(pos);
      var posValue = parseFloat(posPx) || 0;
      return posValue + diff;
    };
    interact(".unit").draggable({
      onmove: function (event) {
        var target = event.target;
        var x = calcPos(target, "left", event.dx);
        var y = calcPos(target, "top", event.dy);
        console.log(x, ", ", y);
        $(target).css({ top: y, left: x });
      },
    });
  },
});
