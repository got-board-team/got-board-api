import Ember from 'ember';

export default Ember.Mixin.create({
  attributeBindings: 'draggable',
  draggable: 'true',
  dragStart: function(event) {
    console.log(1);
    var element = this.get('element');
    window.dragging = true;
    d3.select(element).attr('pointer-events', 'none');
  },
  initialize: function (attribute) {
    console.log(0);
    var elementId = "#" + this.get('elementId');
    console.log(this.dragStart);
    window.drag = d3.behavior.drag().
      on("dragstart", this.dragStart)//.
      //on("drag", dragmove).
      //on("dragend", dragEnd);

    d3.select(elementId).call(drag);
  }.on("init"),
});
