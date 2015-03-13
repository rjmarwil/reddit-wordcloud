class YoutubeController < ApplicationController

  def index
    @name = env['omniauth.auth']['info']['name']
    reddit_fetcher = RedditFetcher.new
    @search_key = reddit_fetcher.search_key
  end
end
