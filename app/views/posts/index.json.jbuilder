json.posts @ret do |post|
    json.id post['id']
    json.title post['title']
    json.description post['description']
    json.user do
        json.id post[:user_id]
        json.first_name post[:user_first_name]
        json.last_name post[:user_last_name]
        json.email post[:user_email]
    end
    json.city do 
        json.id post[:city_id]
        json.name post[:city_name]
    end
    json.town do
        json.id post[:town_id]
        json.name post[:town_name]
    end
end