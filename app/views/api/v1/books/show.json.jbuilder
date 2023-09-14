json.id @book.id
json.title @book.title
json.data @book.data
json.cover @book.gen_cover_url
json.author do
  json.id @author.id
  json.name @author.first_name
  json.last_name @author.last_name
  json.genre @author.genre
end
