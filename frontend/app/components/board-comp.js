import Ember from 'ember';

export default Ember.Component.extend({
  didInsertElement: function() {
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
  }
});
