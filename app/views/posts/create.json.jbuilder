json.post do
    json.id @post.id
    json.title @post.title
    json.description @post.description
    json.town_id @post.town_id
    json.user_id @post.user_id
end