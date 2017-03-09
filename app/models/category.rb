class Category < ActiveRecord::Base

	belongs_to :sistem
	has_many :tests

end
