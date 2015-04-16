import Ember from 'ember';

export default Ember.Component.extend({
  tagName: "foreignObject",
  classNames: ["piece"],
  attributeBindings: ["data-id", "data-type", "x", "y", "height", "width"],
  "data-id": function() {
    return this.unit.id;
  }.property('unit.id'),
  "data-type": function() {
    var unit = this.get('unit');
    return unit.get('type');
  }.property('unit.type'),
  "width": "100%",
  "height": "100%",
  "x": function() {
    var unit = this.get('unit');
    return unit.get('positionX');
  }.property('unit.positionX'),
  "y": function() {
    var unit = this.get('unit');
    return unit.get('positionY');
  }.property('unit.positionY')
});
