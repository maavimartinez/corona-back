json.products @ret do |product|
    json.id product['id']
    json.name product['name']
    json.available product['available']
    json.price product['price']
    json.shop do
        json.id product[:shop_id]
        json.name product[:shop_name]
    end
    json.user do
        json.id product[:user_id]
        json.first_name product[:user_first_name]
        json.last_name product[:user_last_name]
        json.email product[:user_email]
    end
    json.city do 
        json.id product[:city_id]
        json.name product[:city_name]
    end
    json.town do
        json.id product[:town_id]
        json.name product[:town_name]
    end
end