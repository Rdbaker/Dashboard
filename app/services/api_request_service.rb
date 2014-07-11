class APIRequestService
  @@auth = YAML.load_file("#{Rails.root}/authentication.yml")
  def api_request(url, params = {})
    url = "#{url}?#{params.to_param}" unless params.empty?

    res = Typhoeus.get(url)

    if res.code != 200
      handle_bad_res res
    else
      return res
    end

    res
  end

  private

  def handle_bad_res(res)
    "this was a bad response! code: #{res.code}"
  end
end
