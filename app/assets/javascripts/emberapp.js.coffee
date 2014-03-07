#= require jquery
#= require jquery_ujs
#= require foundation
#= require turbolinks
#
#= require handlebars
#= require ember
#= require ember-data-v1.0.0-beta.3
#= require_self
#= require todo
#

# for more details see: http://emberjs.com/guides/application/

window.Todo = Ember.Application.create()

$ ->
  $(document).foundation()
