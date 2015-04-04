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
    $(document).ready(function () {

      function dragStart(d) {
        window.dragging = true;
        d3.select(this).attr('pointer-events', 'none');
      }

      function moveUnit(elm, dx, dy) {
        var x = parseFloat(d3.select(elm).attr("x"));
        var y = parseFloat(d3.select(elm).attr("y"));
        x += dx
        y += dy
        d3.select(elm).attr("x", x).attr("y", y);
      }

      function dragmove(d) {
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


      d3.selectAll(".f").call(drag);

      d3.selectAll(".territory").on("mouseout", function(d){
        d3.selectAll(".territory").classed("drop-actived", false);
      });

      d3.selectAll(".territory").on("mouseover", function(d){
        if (window.dragging) {
          d3.select(this).classed('drop-actived', true);
        }
        window.currentTerritory = this;
        console.log("over", this.parentNode.id);
      });
    });
  },
});
