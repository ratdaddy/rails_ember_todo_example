Todo.Item = DS.Model.extend
  summary: DS.attr 'string'
  is_completed: DS.attr 'boolean'
  due_date: DS.attr 'jsondate'
  priority: DS.attr 'number'

  _locale_due_date: ->
    date = @get('due_date')
    if date?
      date.toLocaleDateString()
    else
      ''

  locale_due_date: `function() {
    return this._locale_due_date();
  }.property('due_date')`
