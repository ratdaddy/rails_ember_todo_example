Todo.TodoController = Ember.ArrayController.extend
  actions:
    createTodo: ->
      summary = this.get('newSummary')
      return if !summary.trim()

      item = @store.createRecord('item',
        summary: summary
        is_completed: false
      )

      @set 'newSummary', ''

      item.save()

isCompleted = (key, value) ->
  model = @get('model')

  return model.get('is_completed') unless value?

  model.set 'is_completed', value
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

  isCompleted: isCompleted.property('model.is_completed')
