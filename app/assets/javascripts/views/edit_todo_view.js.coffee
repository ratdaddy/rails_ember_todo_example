Todo.EditTodoView = Ember.TextField.extend
  didInsertElement: ->
    @$().focus()

Ember.Handlebars.helper 'edit-todo', Todo.EditTodoView
