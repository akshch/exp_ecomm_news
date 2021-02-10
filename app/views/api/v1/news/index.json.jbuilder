json.total_count @news.count
json.news @news do |news|
  source = news.source
  json.source do
    json.id source.slug
    json.name source.name
  end
  json.author news.author
  json.title news.title
  json.description news.description
  json.url news.url
  json.urlToImage news.image_url
  json.publishedAt news.published_at
  json.content news.content
end