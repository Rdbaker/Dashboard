class ArticlesController < ApplicationController
  def initialize
    @timer = Rufus::Scheduler.new
    @timer.every '2h' do
      refresh_data
    end
  end

  def home
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

  def refresh_data
    nprfeed
    redditfeed
  end
end
