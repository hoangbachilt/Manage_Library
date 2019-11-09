class RequestDetail < ApplicationRecord
  belongs_to :request_borrow
  belongs_to :book
end
