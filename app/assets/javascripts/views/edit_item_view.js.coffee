Todo.EditItemView = Ember.TextField.extend
  didInsertElement: ->
    @$().focus()

Ember.Handlebars.helper 'edit-item', Todo.EditItemView
