json.posts @ret do |post|
    json.id post['id']
    json.title post['title']
    json.description post['description']
    json.offering post['offering']
    json.user do
        json.id post[:user_id]
        json.first_name post[:user_first_name]
        json.last_name post[:user_last_name]
        json.email post[:user_email]
        json.phone post[:user_phone]
    end
    json.city do 
        json.id post[:city_id]
        json.name post[:city_name]
    end
    json.town do
        json.id post[:town_id]
        json.name post[:town_name]
        json.city_id post[:city_id]
    end
end
json.status_code 200