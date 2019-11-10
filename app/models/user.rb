class User < ApplicationRecord
  has_one_attached :avatar
  has_many :comments
  has_many :ratings
  has_many :likes
  has_many :follow_authors
  has_many :request_borrow
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
