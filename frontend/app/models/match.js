import DS from 'ember-data';

let Match = DS.Model.extend({
  territories: DS.hasMany({ async: true }),
});

Match.reopenClass({
  FIXTURES: [
    {
      id: 1,
      territories: [11, 22],
    },
  ]
});

export default Match;
