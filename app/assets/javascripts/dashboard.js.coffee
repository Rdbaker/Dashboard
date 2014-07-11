$ ->
  getFeed()


getFeed = ->
  $.ajax '/api/home',
    type: 'GET'
    dataType: 'json'
    error: (status) ->
      console.log(status)
    success: (data) ->
      appendToTable data

appendToTable = (data) ->
  table = $('#feed')
  for article of data
    row = $("<tr  />")
    table.append row
    row.append $("<td>" + data[article].title + "</td>")
    row.append $("<td>" + data[article].source + "</td>")
    row.append $("<td>" + data[article].feed + "</td>")
    row.append $("<td>" + data[article].title + "</td>")
