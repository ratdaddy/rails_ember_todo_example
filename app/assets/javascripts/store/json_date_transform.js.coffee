Todo.JsondateTransform = DS.Transform.extend
  deserialize: (str) ->
    if str? && str.length > 0
      Date.parseDate(str)
    else
      null

  serialize: (date) ->
    if date?
      date.toLocalDateString()
    else
      ''
