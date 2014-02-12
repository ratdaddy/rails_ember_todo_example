# For more information see: http://emberjs.com/guides/routing/

Todo.Router.map ->
  @resource 'todo', path: '/'

Todo.TodoRoute = Ember.Route.extend
  model: ->
    @store.find('item')
