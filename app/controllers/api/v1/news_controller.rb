class Api::V1::NewsController < ApplicationController

  def index
    @news = News.includes(:source)
  end

  def create_news_feeds
    result = News.create_feeds
    render json: result, status: 200
  end

end
