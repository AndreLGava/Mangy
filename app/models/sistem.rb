class Sistem < ActiveRecord::Base
	has_many :categories

	has_many :versions
end
