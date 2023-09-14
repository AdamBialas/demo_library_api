class Author < ApplicationRecord
  GENRE_LIST = %w[Drama Fantasy Fiction Comedy Historical]

  has_many :books, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :genre, presence: true
  validates_inclusion_of :genre, in: GENRE_LIST
end
