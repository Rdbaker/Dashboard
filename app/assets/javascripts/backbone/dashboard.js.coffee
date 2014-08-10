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
  Images: [
    {
      link: 'http://upload.wikimedia.org/wikipedia/commons/e/eb/Mt_Fuji_NASA_ISS002-E-6971_large.jpg'
      about: 'This photo is the view of Mt Fuji taken from the vantage point of the international space station. This mountain is the hightest peak in Japan, located 100km south west of Tokyo in the Chūbu region. The kanji which are used to write the name of the mountain in Japanese mean "wealth" and "status", however the characters are ateji, which means that they were chosen for the pronunciation rather than their meaning.'
    },
    {
      link: 'http://i.imgur.com/lNAamj7.jpg'
      about: "This is a photograph of the view from the side of Beartooth Highway in Wyoming. The 68 mile stretch of highway starts from southwest Montana, stretching through northwest Wyoming before finally leading into Yellowstone National Park's northeast entrance. Beartooth Highway, afterhaving opened in 1937, claimed to have one of the most diverse ecosystems in the United States."
    },
    {
      link: 'http://ppcdn.500px.org/63481077/3f4c0d9dc5a15688295238228a60a150f1fda6d3/2048.jpg'
      about: "This vast, open grasslands, dwarfed by a looming, interminable mountain range is a view which can be found among the Loften archipelago in northern Norway. It is known for its frigid climate, being inside the arctic circle, as well as its sheltered beaches, bays and mountain ranges; many of which are virgin to the distinct impression of humanity."
    },
    {
      link: 'http://i.imgur.com/Eourq.jpg'
      about: "Boulder, Colorado has a very rich rock formation called the Flatirons. Geologistsestimate the age of this formation to be between 35 and 80 million years old, having been given their distinct shape by the Laramide Orogeny (a period of geologic mountain building which started 70 to 80 million years ago, most notably resulting in Laramie Mountains of eastery Wyoming)"
    },
    {
      link: 'http://i.imgur.com/K73bkIP.jpg'
      about: "I've never heard of a 'star fort' but apparently that's what Fort Beautange is. Located in The Netherlands, the original purpose of this fort (as intended by William the Silent) was to control the only road from Germany to Beautange (previously controlled by the Spanairds during the Eighty Years' War). In 1851 the fort was converted to a village, and today stands as a historical museum."
    },
    {
      link: 'http://i.imgur.com/BymaSga.jpg'
      about: "Malé, the capital of the Republic of Maldives (an island nation located to the south west of India), houses just under a third of the nation's total population (105,000 in 2012). The city is known for being the center of political rallies, protests, and events throughout the country's history."
    },
    {
      link: 'http://i.imgur.com/8DhqLfc.jpg'
      about: "Dubai, the most populous city of the UAE is shown here depicting a futuresque, picturesque city. Being well known for its beauty and attractions, Dubai attracts many tourists, being the 7th most visited city in the world."
    },
    {
      link: 'http://i.imgur.com/NATKgC8.jpg'
      about: "A taste of the old contrasted by a distanced view of the new is what London, the capital city of England and the United Kingdom, is all about. Subjectively having the best new/old contrast in a city and objectively having the best underground system of any world city, London is beautiful and accessible while having plenty of plays to see, pubs to crawl, and romantic spots to elope to."
    }
    {
      link: 'http://i.imgur.com/hDdqa63.jpg'
      about: "The city that never sleeps sure is big. This photo takes Manhattan, New York's most densly populated borough, as seen from a bird's eye view from the east against a soft, promising sunrise."
    },
    {
      link: 'http://i.imgur.com/P9knLql.jpg'
      about: "Mist encroaches this village and surrounding rapeseed flower fields and hills situated in the Guizhou Province of China."
    },
    {
      link: 'http://i.imgur.com/PGBXWcf.jpg'
      about: "The village of Hallstatt, Austria is located in the Salzkammergut region of the nation. It has a population of 946 reported in a 2001 census. Aside from being a source of salt dating back to prehistoric times, it would seem that nothing of recorded historical importance took place at Hallstatt."
    },
    {
      link: 'http://i.imgur.com/S2GV4sv.jpg'
      about: "Because Narai-Juku was a stop along the treacherous Torii Pass it quickly flourished as a post town. Narai-Juku is now one of Japan's nationally designated Architectural Preservation sites."
    },
    {
      link: 'http://i.imgur.com/qgJJvMe.jpg'
      about: "A late afternoon sun shines through breaks in the clouds onto this quiant village in Yangshuo county, China. The karst formations form a natural barrier guarding these small villages, as if to shield them from some external danger."
    },
    {
      link: 'http://i.imgur.com/rZcJ0.jpg'
      about: "The Gobi Desert's Crescent Lake is truly a beauty. Located 6 km south of the Dunhuang city in the Gansu Province, this house/museum has been named a World Heritage Site by UNESCO."
    },
    {
      link: 'http://i.imgur.com/FlveP.jpg'
      about: "Lyon has always been my favorite city in France. The night life, combined with the size and personability of the city made it the most enjoyable city in France that I have ever been to."
    }
  ]

  init: () ->
    new Dashboard.Routers.Router
    Backbone.history.start()

$ ->
  Dashboard.init()
