json.extract! article, :id, :title, :content, :author, :published_at, :featured, :image_url, :slug, :created_at, :updated_at
json.url article_url(article, format: :json)
