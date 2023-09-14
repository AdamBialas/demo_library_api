# README
  Demo project of rails API for authors and books catalog , running on postgress database.

* Ruby version

  ruby-3.1.3

* System dependencies

  postgress

* Configuration

  database config in config/database.yml

* Database creation

  rails db:setup

* Database initialization

  rails db:migration

* How to run the test suite

  rake test

* Api functions

  GET api/v1/authors

  list of authors with books list

  {"authors":[{"id":1,"first_name":"Adam","last_name":"Mickiewicz","genre":"Drama","books":[{"id":4,"title":"Pan Tadeusz","cover":null,"data":"{}"}]},{"id":2,"first_name":"Adam","last_name":"Asnyk","genre":"Drama","books":[{"id":6,"title":"Pan Tadeuszek 21","cover":null,"data":{"ilosc":1000,"data_wydania":"01-01-2009"}}]}],"meta":{"current_page":1,"total_pages":1,"per_page_count":2,"total_count":2}}

  - meta is additional info for paginate data

  optional params :

   api/v1/authors?page=x - for get data from page x

   api/v1/authors/:author_id - show only data for :author_id

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

  PUT api/v1/authors/:author_id/books

  update book on :author_id list

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

  DELETE api/v1/authors/:author_id/books

  delete book on :author_id list


