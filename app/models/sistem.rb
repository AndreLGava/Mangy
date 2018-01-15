class Sistem < ActiveRecord::Base
	has_many :categories
	has_many :tests, through: :categories
	has_many :versions
	has_many :sistems
	belongs_to :sistem
end
