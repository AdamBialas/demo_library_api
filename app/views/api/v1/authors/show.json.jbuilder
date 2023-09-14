json.id @author.id
json.first_name @author.first_name
json.last_name @author.last_name
json.genre @author.genre
json.books @author.books do |book|
  json.id book.id
  json.title book.title
  json.cover book.gen_cover_url
  json.data book.data
end
