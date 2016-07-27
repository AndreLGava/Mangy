class Version < ActiveRecord::Base
	has_many :version_tests, dependent: :destroy
	has_many :issues, through: :version_tests, class_name: 'Issue'
	
	validates :responsable, presence: true
	validates :used_user, presence: true
	validates :system, presence: true
	validates :start, presence: true

	def done_version
		return self.finish? ? 'info' : 'danger'
	end
end
