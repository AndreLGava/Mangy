class Test < ActiveRecord::Base
	has_many :version_tests
	
	validates :description, presence: true
	validates :expected_result, presence: true
	validates :status, presence: true

	
end
