Todo.TodoController = Ember.ArrayController.extend
  actions:
    createTodo: ->
      summary = this.get('newSummary')
      return if !summary.trim()

      todo = @store.createRecord('todo',
        summary: summary
        isCompleted: false
      )

      @set 'newSummary', ''

      todo.save()

isCompleted = (key, value) ->
  model = @get('model')

  return model.get('isCompleted') unless value?

  model.set 'isCompleted', value
  model.save()
  value

Todo.TodoItemController = Ember.ObjectController.extend
  actions:
    editTodo: ->
      @set 'isEditing', true

    editingFinished: ->
      @set 'isEditing', false

    acceptChanges: ->
      @set 'isEditing', false
      if Ember.isEmpty(@get('model.summary'))
        @send 'removeTodo'
      else
        @get('model').save()

    removeTodo: ->
      todo = @get('model')
      todo.deleteRecord()
      todo.save()

  isEditing: false

  isCompleted: isCompleted.property('model.isCompleted')
