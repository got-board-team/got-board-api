import Ember from 'ember';
import DraggableMixin from '../../../mixins/draggable';
import { module, test } from 'qunit';

module('DraggableMixin');

// Replace this with your real tests.
test('it works', function(assert) {
  var DraggableObject = Ember.Object.extend(DraggableMixin);
  var subject = DraggableObject.create();
  assert.ok(subject);
});
