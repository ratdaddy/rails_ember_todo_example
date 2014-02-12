#= require jquery
#= require jquery_ujs
#= require foundation
#= require turbolinks
#
#= require ./lib/handlebars-v1.1.2
#= require ./lib/ember
#= require ./lib/ember-data
#= require_self
#= require todo
#

# for more details see: http://emberjs.com/guides/application/

window.Todo = Ember.Application.create()

$ ->
  $(document).foundation()
