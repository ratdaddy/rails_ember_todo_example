Todo.Item = DS.Model.extend
  summary: DS.attr 'string'
  is_completed: DS.attr 'boolean'
  due_date: DS.attr 'jsondate'
  priority: DS.attr 'number'
