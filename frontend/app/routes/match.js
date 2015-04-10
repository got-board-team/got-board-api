import Ember from 'ember';

export default Ember.Route.extend({
  model: function(params) {
    //return this.storage.find(App.Match, params.id);
    var unit1 = {
      id: "1",
      type: "footmen",
      class: "stark-footmen",
      position: { x: 675, y: 548 },
    };
    var unit2 = {
      id: "2",
      type: "knight",
      class: "stark-knight",
      position: { x: 675, y: 648 },
    };
    return {
      winterfell: {
        units: [ unit1, unit2],
      },
    };
  },
  setupController: function(controller, match) {
    controller.set('model', match);
  },
});
