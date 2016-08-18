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
	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |test|
	      csv << test.attributes.values_at(*column_names)
	    end
	  end
	end
end
