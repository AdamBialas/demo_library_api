class Book < ApplicationRecord
  belongs_to :author, foreign_key: "author_id", class_name: "Author"

  def gen_cover_url
    return if self.cover.nil?
    "/api/v1/books/#{self.id}/cover"
  end
end