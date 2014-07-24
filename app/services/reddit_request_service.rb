class RedditRequestService < APIRequestService
  def initialize
    @url = "http://www.reddit.com/r/"
    @params = {
      :format => "json"
    }
    @subreddits = []
  end

  def tech_subs
    programming_sub
    js_sub
    rust_sub
    algies_sub
    python_sub
    vim_sub
    data_sub
    sql_sub
  end

  def make_request
    delete_existing
    total_res = []
    @subreddits.each do |sub|
      send_to = @url + sub
      res = api_request(send_to, @params)
      # make articles from response
    end
  end

  private

  def programming_sub
    @subreddits.push('programming/hot.json?sort=hot')
  end

  def js_sub
    @subreddits.push('javascript/hot.json?sort=hot')
  end

  def rust_sub
    @subreddits.push('rust/hot.json?sort=hot')
  end

  def algies_sub
    @subreddits.push('algorithms/hot.json?sort=hot')
  end

  def python_sub
    @subreddits.push('Python/hot.json?sort=hot')
  end

  def vim_sub
    @subreddits.push('vim/hot.json?sort=hot')
  end

  def data_sub
    @subreddits.push('dataisbeautiful/hot.json?sort=hot')
  end

  def sql_sub
    @subreddits.push('sql/hot.json?sort=hot')
  end
end
