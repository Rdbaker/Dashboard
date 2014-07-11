class DashboardController < ApplicationController
  def index
    n = NPRRequestService.new()
    n.technology_topic()
    p n.make_request()
  end
end
