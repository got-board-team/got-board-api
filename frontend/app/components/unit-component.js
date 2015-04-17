import Ember from 'ember';
import Draggable from '../mixins/draggable';

export default Ember.Component.extend(Draggable, {
  tagName: "foreignObject",
  classNames: ["piece"],
  attributeBindings: ["data-id", "data-type", "x", "y", "height", "width"],
  "width": "100%",
  "height": "100%",
  "data-id": function() {
    return this.unit.id;
  }.property('unit.id'),
  "data-type": function() {
    var unit = this.get('unit');
    return unit.get('type');
  }.property('unit.type'),
  "x": function() {
    var unit = this.get('unit');
    return unit.get('positionX');
  }.property('unit.positionX'),
  "y": function() {
    var unit = this.get('unit');
    return unit.get('positionY');
  }.property('unit.positionY'),
  didInsertElement: function() {
    this.initializeDrag();
  }
});
