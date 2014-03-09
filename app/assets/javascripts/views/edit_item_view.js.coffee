Todo.EditItemView = Ember.TextField.extend
  didInsertElement: ->
    @$().focus()

Ember.Handlebars.helper 'edit-item', Todo.EditItemView

Todo.ItemDueDateInputView = Ember.TextField.extend
  didInsertElement: ->
    @$().datepicker dateFormat: "m/d/yy"

Ember.Handlebars.helper 'item-due-date-input', Todo.ItemDueDateInputView

Todo.ItemPriorityInput = Ember.Select.extend
  content: [1, 2, 3]

Ember.Handlebars.helper 'item-priority-input', Todo.ItemPriorityInput
