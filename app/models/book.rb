class Book < ApplicationRecord
  has_one_attached :picture
  belongs_to :author
  belongs_to :category
  belongs_to :publisher
  has_many :request_details, dependent: :destroy
  has_many :follow_books
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validate :set_quanity


  scope :check_quanity, -> { where("quanity >= 0") }

  private
  def set_quanity
    if self.quanity <= 0
      self.status = 0
    end
  end
end
