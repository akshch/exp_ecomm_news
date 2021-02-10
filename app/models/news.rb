require 'net/http'
class News < ApplicationRecord

  has_one :source

  def self.fetch_feeds
    url = URI("https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=0a708bae59cd4f92b26a6bc4c114f1f0")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    response.code == "200" ? JSON.parse(response.body) : {}
  end

  def self.create_feeds
    result = News.fetch_feeds
    if result.present?
      articles = result['articles']
      articles.each do |article|
        news = News.find_or_initialize_by(title: article['title'])
        news.author = article['author'] 
        news.description = article['description'] 
        news.url = article['url'] 
        news.image_url = article['urlToImage'] 
        news.published_at = Time.parse(article['publishedAt']) 
        news.content = article['content']
        news.save
        source = news.source || news.build_source
        source.slug = article['source']['id']
        source.name = article['source']['name']
        source.save
      end
      { success: 'News Feed Added Sucessfully' }
    else
      { status: 'ok', message: 'No News Feed Found' }
    end
  end

end
