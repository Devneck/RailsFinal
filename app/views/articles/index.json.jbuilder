json.array!(@articles) do |article|
  json.extract! article, :title, :author, :published_date, :published, :content, :thumbnail
  json.url article_url(article, format: :json)
end
