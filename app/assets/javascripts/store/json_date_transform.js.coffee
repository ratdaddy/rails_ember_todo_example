Todo.JsondateTransform = DS.Transform.extend
  deserialize: (str) ->
    Date.parseDate(str)

  serialize: (date) ->
    date.toLocalDateString()
