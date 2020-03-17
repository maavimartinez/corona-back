json.post do
    json.id @post.id
    json.title @post.title
    json.description @post.description
    json.user do
        json.id @user.id
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