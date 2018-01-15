class Category < ActiveRecord::Base

	belongs_to :sistem
	has_many :tests

	#validates :description, uniqueness: true
end
