json.post do  
  json.id @post.id
    json.title @post.title
    json.description @post.description
    json.offering @post.offering
    json.user do
        json.id @current_user.id
        json.first_name @current_user.first_name
        json.last_name @current_user.last_name
        json.email @current_user.email
        json.phone @current_user.phone
    end
    json.city do 
        json.id @city.id
        json.name @city.name
    end
    json.town do
        json.id @town.id
        json.name @town.name
        json.city_id @city.id
end
end
json.status_code 201