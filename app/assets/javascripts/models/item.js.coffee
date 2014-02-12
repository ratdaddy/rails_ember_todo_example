# for more details see: http://emberjs.com/guides/models/defining-models/

Todo.Item = DS.Model.extend
  summary: DS.attr 'string'
  is_completed: DS.attr 'boolean'
