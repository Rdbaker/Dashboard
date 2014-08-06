class Dashboard.Routers.Router extends Backbone.Router
  routes: {
    'news' : 'news',
    'home' : 'home',
    ''     : 'home'
  }

  news: () ->
    new Dashboard.Views.NewsView({ el: $('body') })

  home: () ->
    new Dashboard.Views.HomeView({ el: $('body') })
