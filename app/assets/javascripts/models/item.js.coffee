Todo.Item = DS.Model.extend
  summary: DS.attr 'string'
  is_completed: DS.attr 'boolean'
  due_date: DS.attr 'jsondate'
  priority: DS.attr 'number'

  dueDateString: `function() {
    return this.get('due_date').toLocaleDateString();
  }.property('due_date')`
