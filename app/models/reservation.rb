class Reservation < ApplicationRecord
	belongs_to :restaurant
	belongs_to :history
end
