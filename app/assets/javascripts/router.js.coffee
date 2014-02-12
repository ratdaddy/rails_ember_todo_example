# For more information see: http://emberjs.com/guides/routing/

Todo.Router.map ->
  @resource 'items', path: '/'

Todo.ItemsRoute = Ember.Route.extend
  model: ->
    @store.find('item')
