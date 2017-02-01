class Category < ActiveRecord::Base

	has_many :sistems

	has_many :tests
end
