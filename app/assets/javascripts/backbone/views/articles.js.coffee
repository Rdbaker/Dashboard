$ ->

  class Dashboard.Views.ArticlesView extends Backbone.View
    initialize: () ->
      @getFeed(@appendToTable)

    getFeed: (callback) ->
      $.ajax '/api/home',
        type: 'GET'
        dataType: 'json'
        error: (status) ->
          console.log(status)
        success: (data) ->
          callback(data)

    appendToTable: (data) ->
      table = $('#feed')
      for article in data
        row = $('<tr  />')
        src = article.source
        row.append $("<td>#{article.title}</td>")
        row.append $("<td>TODO: pretty picture</td>")
        row.append $("<td>#{article.feed}</td>")
        row.append $("<td>#{article.date_posted}</td>")
        table.append(row)

    getImageFromSource: (source) ->
      src_map =
        'NPR': 'assets/npr_logo.jpg'
      src_map[source]

  new Dashboard.Views.ArticlesView
