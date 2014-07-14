class ArticlesController < ApplicationController
  def home
    nprfeed()
    render :json => Article.all
  end

  def nprfeed
    n = NPRRequestService.new()
    n.technology_topic()
    n.digital_topic()
    n.make_request()
  end
end
