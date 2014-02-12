Todo.ItemsController = Ember.ArrayController.extend
  actions:
    createItem: ->
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

Todo.ItemController = Ember.ObjectController.extend
  actions:
    editItem: ->
      @set 'isEditing', true

    editingFinished: ->
      @set 'isEditing', false

    acceptChanges: ->
      @set 'isEditing', false
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