class Author < ApplicationRecord
  GENRE_LIST = %w[Drama Fantasy Fiction Comedy Historical]

  has_many :books, dependent: :destroy

  validates :first_name, presence: true
  validates_length_of :first_name, maximum: 32
  validates :last_name, presence: true
  validates_length_of :last_name, maximum: 32
  validates :genre, presence: true
  validates_inclusion_of :genre, in: GENRE_LIST
end
