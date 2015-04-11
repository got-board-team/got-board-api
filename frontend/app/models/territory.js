import DS from 'ember-data';

let attr = DS.attr;

let Territory = DS.Model.extend({
  match: DS.belongsTo("match"),
  slug: attr(),
  units: DS.hasMany({ async: true }),
});

Territory.reopenClass({
  FIXTURES: [
    {
      id: 11,
      match: 1,
      slug: "winterfell",
      units: [111, 222],
    },
  ]
});

export default Territory;
