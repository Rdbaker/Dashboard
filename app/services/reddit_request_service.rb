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
    @subreddits.each do |sub|
      send_to = @url + sub
      res = api_request(send_to, @params)
      make_articles res
    end
  end

  private

  def make_articles(res)
    ret = JSON.parse(res.body)
    ret["data"]["children"].each do |post|
      a = Article.new()
      a.created_at = DateTime.now
      a.title = post["data"]["title"]
      a.source = "Reddit"
      a.link = post["data"]["url"]
      a.date_posted = format_date(post["data"]["created_utc"])
      a.feed = post["data"]["subreddit"]
      a.content = get_content(post)
      a.save()
    end
  end

  def delete_existing
    Article.where(:source => "Reddit").delete_all
  end

  def format_date(utc)
    temp = ""
    days = {
      0 => "Sun, ",
      1 => "Mon, ",
      2 => "Tue, ",
      3 => "Wed, ",
      4 => "Thu, ",
      5 => "Fri, ",
      6 => "Sat, ",
      7 => "Sun, "
    }
    months = {
      1 => "Jan ",
      2 => "Feb ",
      3 => "Mar ",
      4 => "Apr ",
      5 => "May ",
      6 => "Jun ",
      7 => "Jul ",
      8 => "Aug ",
      9 => "Sep ",
      10 => "Oct ",
      11 => "Nov ",
      12 => "Dec "
    }
    my_time = Time.at(utc)
    temp += days[my_time.wday]
    temp += String(my_time.day) + " "
    temp += months[my_time.mon]
    temp += String(my_time.year)
  end

  def get_content(post)
    if post["data"]["selftext"].nil?
      "This post was a self post, read the comments <a href='reddit.com#{post["data"]["permalink"]}'>here</a>."
    else
      post["data"]["selftext"]
    end
  end

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
