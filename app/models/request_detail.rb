class RequestDetail < ApplicationRecord
  belongs_to :book
  belongs_to :request_borrow, optional: true
  belongs_to :cart

  validates :quanity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :book_present
  validate :cart_present

  private
  def book_present
    if book.nil?
      errors.add(:book, "is not valid or is not active.")
    end
  end

  def cart_present
    if cart.nil?
      errors.add(:cart, "is not a valid cart.")
    end
  end
end
