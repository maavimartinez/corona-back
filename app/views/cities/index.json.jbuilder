json.cities @ret do |city|
    json.id post['id']
    json.name post['name']
end
json.status_code 200