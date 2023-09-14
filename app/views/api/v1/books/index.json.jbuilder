json.books @result[:books] do |book|
  json.id book.id
  json.title book.title
  json.data book.data
  json.cover book.gen_cover_url
  json.author do
    json.id book.author.id
    json.name book.author.first_name
    json.last_name book.author.last_name
    json.genre book.author.genre
  end
end
json.meta @result[:meta] if @result[:meta]
