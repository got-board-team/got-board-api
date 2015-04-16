import Ember from 'ember';

export default Ember.Component.extend({
  didInsertElement: function() {
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
      console.log(this.getAttribute("data-unit-type") +
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
  },
  actions: {
  }
});
