class RedditFetcher

  def initialize
    @reddit = Faraday.new(:url => 'https://www.reddit.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def earthporn
    response = @reddit.get do |req|
      req.url "/r/EarthPorn/.json"
      req.headers['Reddit-Token'] = ENV["REDDIT_TOKEN"]
      req.headers['Content-Type'] = 'application/json'
    end

    JSON.parse(response.body)
  end

end
