class ArticlesController < ApplicationController
  def initialize
    @last_update = Time.now
  end

  def home
    if four_hours_passed
      nprfeed()
      redditfeed()
    end
    render :json => Article.all
  end

  def nprfeed
    n = NPRRequestService.new()
    n.technology_topic()
    n.digital_topic()
    n.make_request()
  end

  def redditfeed
    r = RedditRequestService.new()
    r.tech_subs()
    r.make_request()
  end

  def four_hours_passed
    time_since_last = Time.now - @last_update
    hours_since_last = time_since_last / (60*60)
    hours_since_last >= 4
  end
end
