class ArticlesController < ApplicationController
  def home
    nprfeed()
    redditfeed()
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
end
