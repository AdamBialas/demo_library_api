# README
  Demo project of rails API for authors and books catalog , running on postgress database.

* Ruby version

  ruby-3.1.3

* System dependencies

  postgress

* Configuration

  database config in config/database.yml

   set correct values for :

    username: , password:  host: , port:

* Database creation

  rails db:setup

* Database initialization

  rails db:migration

* How to run the test suite

  rails s

* How to run the test suite

  rake test

* Api endpoints

---

  GET api/v1/authors

  list of authors with books list

  {"authors":[{"id":1,"first_name":"Adam","last_name":"Mickiewicz","genre":"Drama","books":[{"id":4,"title":"Pan Tadeusz","cover":null,"data":"{}"}]},{"id":2,"first_name":"Adam","last_name":"Asnyk","genre":"Drama","books":[{"id":6,"title":"Pan Tadeuszek 21","cover":null,"data":{"ilosc":1000,"data_wydania":"01-01-2009"}}]}],"meta":{"current_page":1,"total_pages":1,"per_page_count":2,"total_count":2}}

  - meta is additional info for paginate data

  optional params :

   api/v1/authors?page=x - for get data from page x

 ---

  GET api/v1/authors/:author_id 
  
  show only data for :author_id

  {"id":1,"first_name":"Adam","last_name":"Mickiewicz","genre":"Drama","books":[{"id":4,"title":"Pan Tadeusz","cover":null,"data":"{}"}]}

---

  POST api/v1/authors

  json body to send  { 'author': {'first_name': "Adam", 'last_name': "Mickiewicz" , 'genre': "Drama"  }}

  create new autor

   {
    "id": 4,
    "first_name": "Adam",
    "last_name": "Mickiewicz",
    "genre": "Drama",
    "created_at": "2023-09-14T19:57:55.893Z",
    "updated_at": "2023-09-14T19:57:55.893Z"
   }

---

  PUT api/v1/authors/:author_id

  json body to send  { 'author': {'first_name': "Adam", 'last_name': "Mickiewicz" , 'genre': "Comedy"  }}

  update autor data

  status 201

  {
    "id": 4,
    "first_name": "Adam",
    "last_name": "Mickiewicz",
    "genre": "Comedy",
    "created_at": "2023-09-14T19:57:55.893Z",
    "updated_at": "2023-09-14T19:59:51.813Z"
   }

---

  DELETE api/v1/authors/:author_id

   remove author and his books from catalog


---

  GET api/v1/authors/:author_id/books

  get book list for :author_id

  {"books":[{"id":4,"title":"Pan Tadeusz","data":"{}","cover":null,"author":{"id":1,"name":"Adam","last_name":"Mickiewicz","genre":"Drama"}}],"meta":{"current_page":1,"total_pages":1,"per_page_count":2,"total_count":1}}

  - meta is additional info for paginate data

  optional params :

   api/v1/authors?page=x - for get data from page x

---

  POST api/v1/authors/:author_id/books

  create book on :author_id list

  json body to send  { "book": {"title": "Pan Tadeusz", "data": { "ilosc": 100} }}

  status 201

  {
    "id": 14,
    "title": "Pan Tadeusz",
    "cover": null,
    "data": {
        "ilosc": 100
    },
    "author_id": 4,
    "created_at": "2023-09-14T20:14:04.515Z",
    "updated_at": "2023-09-14T20:14:04.515Z"
  }

---

  PUT api/v1/authors/:author_id/books/:book_id

  update book with :book_id on :author_id list

  json body to send  { "book": {"title": "Pan Tadeusz", "data": { "ilosc": 200} }}

  status 201

  {
    "id": 14,
    "title": "Pan Tadeusz",
    "cover": null,
    "data": {
        "ilosc": 200
    },
    "author_id": 4,
    "created_at": "2023-09-14T20:14:04.515Z",
    "updated_at": "2023-09-14T20:14:04.515Z"
  }

---

  DELETE api/v1/authors/:author_id/books/:book_id

  delete book with :book_id from :author_id list

---

  POST api/v1/authors/:author_id/books/:book_id/cover

  data to send 
  "Content-Type: multipart/form-data" 
   "photo=//binary stream of image data//"

  upload cover jpg file for book with :book_id

  status 201
  {
    "id": 5,
    "cover": "/api/v1/books/5/cover"
  }

---

  DELETE api/v1/authors/:author_id/books/:book_id/cover
   
  clear cover file for book with :book_id


---

  GET api/v1/books/

  list of books in the library (with authors info)
  
  {"books":[{"id":4,"title":"Pan Tadeusz","data":"{}","cover":null,"author":{"id":1,"name":"Adam","last_name":"Mickiewicz","genre":"Drama"}},{"id":6,"title":"Pan Tadeuszek 21","data":{"ilosc":1000,"data_wydania":"01-01-2009"},"cover":null,"author":{"id":2,"name":"Adam","last_name":"Asnyk","genre":"Drama"}}],"meta": 
  {"current_page":1,"total_pages":6,"per_page_count":2,"total_count":11}}
  
  - meta is additional info for paginate data

  optional params :

   api/v1/books?page=x - for get data from page x

---

  GET api/v1/books/:book_id

  get info for current book with :book_id

  {"id":4,"title":"Pan Tadeusz","data":"{}","cover":null,"author":{"id":1,"name":"Adam","last_name":"Mickiewicz","genre":"Drama"}}

---

  GET api/v1/books/:book_id/cover

  get jpeg image of cover book with :book_id


---

Api endpints without user restrictions :
  
  GET api/v1/authors
  
  GET api/v1/authors/:author_id
  
  GET api/v1/books/
  
  GET api/v1/books/:book_id
  
  GET api/v1/books/:book_id/cover
  
  



  
  

  



