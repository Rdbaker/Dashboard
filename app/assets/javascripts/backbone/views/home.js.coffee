class Dashboard.Views.HomeView extends Backbone.View
  template: JST['backbone/templates/home_view']

  initialize: () ->
    @render()

  render: () ->
    @$el.html(@template())

