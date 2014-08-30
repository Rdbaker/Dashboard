class Dashboard.Views.HomeView extends Backbone.View
  template: JST['backbone/templates/home_view']

  about_image: ''

  initialize: () ->
    @render()
    @update_clock()
    @update_date()
    @update_background()

  render: () ->
    @$el.html(@template())
    @about_image = new Opentip('#image-info', 'changeme', { stem: false, style: 'dark', fixed: true,  })

  update_clock: () =>
    if moment().format('hh') > 9
      $('#clock').html moment().format('hh:mm')
    else
      $('#clock').html moment().format('h:mm')
    # call me again in 15 seconds
    setTimeout(@update_clock, 15000)

  update_date: () =>
    date = moment().format('llll').split(' ').slice(0,-2).join(' ')
    $('#date').html date
    # call me again in one hour
    setTimeout(@update_date, 3600000)

  update_background: () =>
    img_elt = $("#home-background")
    image = @random_image()
    while image.link == img_elt.src
      image = @random_image()
    img_elt.fadeOut(1000, () =>
      img_elt.one('load', () =>
        img_elt.fadeIn(1000)
        @about_image.setContent(image.about)
      ).attr('src', image.link)
    )
    # call me again in 5 minutes
    setTimeout(@update_background, 300000)

  random_image: () =>
    Dashboard.Images[Math.round(Math.random()*(Dashboard.Images.length-1))]
