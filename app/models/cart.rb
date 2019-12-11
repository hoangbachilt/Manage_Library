class Cart < ApplicationRecord
	has_many :request_details, dependent: :destroy
	has_many :books , through: :request_details
end
