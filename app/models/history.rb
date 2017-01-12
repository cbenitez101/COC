class History < ApplicationRecord
	belongs_to :user
	has_many :order, :foreign_key => 'history_id'
	has_many :reservation, :foreign_key => 'history_id'
end
