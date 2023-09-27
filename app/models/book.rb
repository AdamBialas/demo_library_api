class Book < ApplicationRecord
  belongs_to :author, foreign_key: "author_id", class_name: "Author"
  validates :title, presence: true
  validates_length_of :title, maximum: 128

  def self.books_with_authors
    Book.all.includes(:author)
  end

  def gen_cover_url
    return if self.cover.nil?
    "/api/v1/books/#{self.id}/cover"
  end
end
