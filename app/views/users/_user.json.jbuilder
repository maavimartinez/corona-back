json.extract! user, :id, :firstName, :lastName, :email, :password, :phone
json.url user_url(user, format: :json)
