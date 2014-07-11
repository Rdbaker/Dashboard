class ArticlesController < ApplicationController
  def home
    render :json => Article.all
  end

  def nprfeed
    n = NPRRequestService.new()
    n.technology_topic()
    p n.make_request()
  end
end
