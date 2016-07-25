class Version < ActiveRecord::Base
	has_many :version_tests
end
