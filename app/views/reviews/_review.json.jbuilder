json.extract! review, :id, :title, :description, :rate, :created_at, :updated_at
json.url review_url(review, format: :json)
