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
    delete_existing
    res = api_request(@url, @params)
    make_articles res
  end

  private

  def make_articles(res)
    ret = JSON.parse(res.body)
    ret["list"]["story"].each do |story|
      a = Article.new()
      a.title = story["title"]["$text"]
      a.source = "NPR"
      a.link = story["link"][0]["$text"]
      a.feed = get_feed()
      a.date_posted = story["storyDate"]["$text"]
      a.content = get_story_text(story)
      if !overlapping(a)
        a.save()
      end
    end
  end

  def add_id(params, id)
    if params.has_key?(:id)
      params[:id] = params[:id] + ",#{id}"
    else
      params[:id] = id
    end
  end

  def get_story_text(story)
    if story.has_key?("textWithHtml")
      return parse_with_html(story["textWithHtml"])
    elsif story.has_key?("fullText")
      # TODO: find a case for this which text_with_html doesn't cover
      return parse_full_text(story["fullText"])
    elsif story.has_key?("audio")
      #TODO: real time media play with jPlayer
      # media stream url under: story["audio"]["mediastream"]["$text"]
      return "Sorry, this is an audio story only, which is not currently supported. You should definitely contact Ryan, though, because this is on his Todo list."
    else
      return "I don't even know what NPR just gave me..."
    end
  end

  def parse_with_html(story)
    temp = ""
    story["paragraph"].each do |paragraph|
      temp += paragraph["$text"] + '\n'
    end
    temp
  end

  def parse_full_text(story)
    "I haven't seen this yet, if you do, it's an error and you should tell Ryan. Fixing this is on his Todo list."
  end

  # parse the topic from the url of the story
  def get_feed()
    feed_map = {
      '1019' => 'Technology',
      '1049' => 'Digital Life'
    }
    temp = ''
    feed = @params[:id].split(',')
    feed.each_with_index do |f, index|
      if index == 0
        temp = feed_map[f]
      else
        temp += '/'+feed_map[f]
      end
    end
    temp
  end

  def delete_existing
    ids = @params[:id].split(",")
    ids.each do |id|
      Article.where(:feed => id).delete_all
    end
  end

  # sometimes NPR stories fall under
  # multiple topics. We don't want duplicates
  def overlapping(article)
    if a = Article.where(:title => article.title, :source => article.source).first
      a.feed = a.feed + "," + article.feed
      return true
    else
      return false
    end
  end
end
