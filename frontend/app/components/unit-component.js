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
  setupDragAndDrop: function () {
    // TODO refatorar
    $(document).ready(function () {

      function dragStart() {
        window.dragging = true;
        d3.select(this).attr('pointer-events', 'none');
      }

      function moveUnit(elm, dx, dy) {
        var x = parseFloat(d3.select(elm).attr("x")) || 0;
        var y = parseFloat(d3.select(elm).attr("y") || 0);
        x += dx;
        y += dy;
        d3.select(elm).attr("x", x).attr("y", y);
      }

      function dragmove() {
        var ev = d3.event;
        moveUnit(this, ev.dx, ev.dy);
      }

      function dragEnd() {
        window.dragging = false;
        d3.select(this).attr( 'pointer-events', null);
        d3.selectAll(".territory").classed("drop-actived", false);
        console.log(this.getAttribute("data-type") +
        ' was dropped into ' +
        window.currentTerritory.parentNode.id +
        ' at x: ' + this.getAttribute("x") +
        ' , y: ' + this.getAttribute("y")
        );
      }

      var drag = d3.behavior.drag().
        on("dragstart", dragStart).
        on("drag", dragmove).
        on("dragend", dragEnd);



      d3.selectAll(".territory").on("mouseout", function(){
        d3.selectAll(".territory").classed("drop-actived", false);
      });

      d3.selectAll(".territory").on("mouseover", function(){
        if (window.dragging) {
          d3.select(this).classed('drop-actived', true);
        }
        window.currentTerritory = this;
        console.log("over", this.parentNode.id);
      });

      d3.selectAll(".piece").call(drag);
    });
  }.on("init"),
});
