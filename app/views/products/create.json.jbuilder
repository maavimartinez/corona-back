json.product do
    json.id @product.id
    json.name @product.name
    json.available @product.available
    json.price @product.price
    json.user_id @product.user_id
    json.town_id @product.town_id
    json.shop_id @shop.id
    json.shop_name @shop.name
end