class Dashboard.Views.NewsView extends Backbone.View
  template: JST['backbone/templates/news_view']

  initialize: () ->
    @render()
    @getFeed(@appendToTable)

  events: "click #refresh" : "refresh"

  render: () ->
    @$el.html(@template())

  getFeed: (callback) =>
    $.ajax '/api/home',
      type: 'GET'
      dataType: 'json'
      error: (status) ->
        console.log(status)
      success: (data) ->
        callback(data)

  refresh: () =>
    $.ajax '/api/refresh',
      type: 'GET'
      dataType: 'json'
      error: (status) ->
        console.log(status)
      success: (data) =>
        @getFeed(@appendToTable)

  appendToTable: (data) =>
    table = $('#feed')
    table.empty()
    for article in data
      article.date_posted = @formatDate(article)
      article.src_pic = @getImageFromSource(article.source)
      table.append(JST['backbone/templates/articles_view']({article: article}))
      $('#stories').append(JST['backbone/templates/articles_modal']({article: article}))

  getImageFromSource: (source) =>
    src_map =
      'NPR': '/npr_logo.jpg',
      'Reddit': '/reddit_logo.png'
    src_map[source]

  formatDate: (article) =>
    if article.source == 'NPR'
      date = article.date_posted.split(' ')
      date = date.slice(0, 4)
      date.join(' ')
    else
      article.date_posted

