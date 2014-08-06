#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Dashboard =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

  init: () ->
    new Dashboard.Routers.Router
    Backbone.history.start()

$ ->
  Dashboard.init()
