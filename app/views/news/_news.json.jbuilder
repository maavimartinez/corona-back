json.extract! news, :id, :title, :body, :date_time, :created_at, :updated_at
json.url news_url(news, format: :json)
