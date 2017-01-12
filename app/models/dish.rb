class Dish < ApplicationRecord
	has_and_belongs_to_many :orders
	scope :active, lambda { where("dishes.active =1")}
end
