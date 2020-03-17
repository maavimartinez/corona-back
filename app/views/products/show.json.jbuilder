json.product do
    json.id @product.id
    json.name @product.name
    json.available @product.available
    json.price @product.price
    json.shop do
        json.id @shop.id
        json.name @shop.name
    end
    json.user do
        json.first_name @user.first_name
        json.last_name @user.last_name
        json.email @user.email
    end
    json.city do
        json.id @city.id
        json.name @city.name
    end
    json.town do
        json.id @town.id
        json.name @town.name
    end
end