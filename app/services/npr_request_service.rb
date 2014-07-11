class NPRRequestService < APIRequestService
  def initialize
    @url = "http://api.npr.org/query"
    @params = {
      :apiKey     => ENV['NPR_APIKEY'],
      :format     => "json",
      :numResults => "10"
    }
  end

  def technology_topic
    add_id(@params, "1019")
  end

  def digital_topic
    add_id(@params, "1049")
  end

  def make_request
    res = api_request(@url, @params)
    make_article res
  end

  private

  def make_article(res)
    JSON.parse(res.body)
  end

  def add_id(params, id)
    if params.has_key?(id)
      params[:id] = params[:id] + ",#{id}"
    else
      params[:id] = id
    end
  end
end
