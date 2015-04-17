import Ember from 'ember';

export default Ember.Mixin.create({
  attributeBindings: 'draggable',
  draggable: 'true',
  dragStart: function() {
    var element = this;
    window.dragging = true;
    d3.select(element).attr('pointer-events', 'none');
  },
  dragmove: function() {
    var ev = d3.event;
    var x = parseFloat(d3.select(this).attr("x")) || 0;
    var y = parseFloat(d3.select(this).attr("y") || 0);
    x += ev.dx;
    y += ev.dy;
    d3.select(this).attr("x", x).attr("y", y);
  },
  dragEnd: function() {
    window.dragging = false;
    d3.select(this).attr( 'pointer-events', null);
    d3.selectAll(".territory").classed("drop-actived", false);
    window.currentTerritory.parentNode.appendChild(this);
    console.log(this.getAttribute("data-type") +
                ' was dropped into ' +
                window.currentTerritory.parentNode.id +
                ' at x: ' + this.getAttribute("x") +
                ' , y: ' + this.getAttribute("y")
               );
  },
  initializeDrag: function (attribute) {
    var elementId = "#" + this.get('elementId');

    window.drag = d3.behavior.drag()
      .on("dragstart", this.dragStart)
      .on("drag", this.dragmove)
      .on("dragend", this.dragEnd);

    d3.select(elementId).call(drag);
  }.on("init"),
});
