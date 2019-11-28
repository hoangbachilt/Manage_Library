class Book < ApplicationRecord
  has_one_attached :picture
  belongs_to :author
  belongs_to :category
  belongs_to :publisher
  has_many :request_details
  has_many :follow_books
  has_many :comments
  has_many :likes
end
