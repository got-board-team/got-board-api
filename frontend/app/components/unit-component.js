import Ember from 'ember';

export default Ember.Component.extend({
  tagName: "foreignObject",
  classNames: ["piece"],
  attributeBindings: ["data-id", "data-type", "x", "y", "height", "width"],
  setDefaultProperties: function(){
    var unit = this.unit;
    this.setProperties({ "data-id": unit.id,
                         "data-type": unit.type,
                         "width": "100%",
                         "height": "100%",
    });
    this.setProperties(unit.position);
  }.on("init"),
});
