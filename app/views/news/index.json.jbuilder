json.news @ret do |news|
    json.id news.id
    json.title news.title
    json.description news.body
    json.date_time news.date_time
    json.source news.source
end
json.status_code 201