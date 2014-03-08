Todo.EditItemView = Ember.TextField.extend
  didInsertElement: ->
    @$().focus()

Ember.Handlebars.helper 'edit-item', Todo.EditItemView

Todo.EnterItemDueDateView = Ember.TextField.extend
  didInsertElement: ->
    @$().datepicker()

Ember.Handlebars.helper 'enter-item-due-date', Todo.EnterItemDueDateView

Todo.EditItemDueDateView = Ember.TextField.extend
  didInsertElement: ->
    @$().datepicker()

Ember.Handlebars.helper 'edit-item-due-date', Todo.EditItemDueDateView

Todo.ItemPriorityInput = Ember.Select.extend
  content: [1, 2, 3]

Ember.Handlebars.helper 'item-priority-input', Todo.ItemPriorityInput
