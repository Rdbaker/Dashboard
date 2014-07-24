$ ->

  class Dashboard.Views.ArticlesView extends Backbone.View
    initialize: () ->
      @getFeed(@appendToTable)

    getFeed: (callback) =>
      $.ajax '/api/home',
        type: 'GET'
        dataType: 'json'
        error: (status) ->
          console.log(status)
        success: (data) ->
          callback(data)

    appendToTable: (data) =>
      table = $('#feed')
      for article in data
        article.date_posted = @formatDate(article)
        article.src_pic = @getImageFromSource(article.source)
        table.append(JST['backbone/templates/articles_view']({article: article}))
        $('#stories').append(JST['backbone/templates/articles_modal']({article: article}))

    getImageFromSource: (source) =>
      src_map =
        'NPR': '/npr_logo.jpg'
      src_map[source]

    formatDate: (article) =>
      if article.source == 'NPR'
        date = article.date_posted.split(' ')
        date = date.slice(0, 4)
        date.join(' ')
      else
        article.date

  new Dashboard.Views.ArticlesView
