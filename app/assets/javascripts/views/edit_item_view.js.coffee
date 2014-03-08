Todo.EditItemView = Ember.TextField.extend
  didInsertElement: ->
    @$().focus()

Ember.Handlebars.helper 'edit-item', Todo.EditItemView

Todo.EditItemDueDateView = Ember.TextField.extend
  didInsertElement: ->
    @$().datepicker()

Ember.Handlebars.helper 'edit-item-due-date', Todo.EditItemDueDateView
