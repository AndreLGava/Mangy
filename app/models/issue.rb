class Issue < ActiveRecord::Base
  belongs_to :version_test
  belongs_to :test

  validates :link, presence: true, uniqueness: true
  validates :version_test_id, presence: true


    def status
    	if self.available_for_test
    		return self.done ? 'success' : 'warning'
    	else
    		return 'danger'
    	end
	end
end
