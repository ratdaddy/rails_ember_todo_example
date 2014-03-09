Todo.ItemsController = Ember.ArrayController.extend
  actions:
    createItem: ->
      ret_obj =
        is_completed: false
        summary: @get('newSummary')
        priority: @get('priority')

      date = @get('locale_due_date')
      if date? && date.length > 0
        ret_obj.due_date = Date.parseDate(@get('locale_due_date'))
      
      return if !ret_obj.summary? || !ret_obj.summary.trim()

      item = @store.createRecord('item', ret_obj
        #summary: summary
        #is_completed: false
        #due_date: due_date
        #priority: priority
      )

      @set 'newSummary', ''
      @set 'locale_due_date', ''

      item.save()

  priorities: [1, 2, 3]

isCompleted = (key, value) ->
  model = @get('model')

  return model.get('is_completed') unless value?

  model.set 'is_completed', value
  model.save()
  value

Todo.ItemController = Ember.ObjectController.extend
  actions:
    editItem: ->
      @set 'isEditing', true

    editingFinished: ->
      @set 'isEditing', false
      @send 'acceptChanges'

    acceptChanges: ->
      @set 'isEditing', false
      date = @get('locale_due_date')
      if date? && date.length > 0
        @set 'due_date', Date.parseDate(date)
      else
        @set 'due_date', null

      if Ember.isEmpty(@get('model.summary'))
        @send 'removeItem'
      else
        @get('model').save()

    removeItem: ->
      item = @get('model')
      item.deleteRecord()
      item.save()

  isEditing: false

  isCompleted: isCompleted.property('model.is_completed')
