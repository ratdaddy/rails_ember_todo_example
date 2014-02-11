# for more details see: http://emberjs.com/guides/models/defining-models/

Todo.Item = DS.Model.extend
  summary: DS.attr 'string'
  isCompleted: DS.attr 'boolean'
