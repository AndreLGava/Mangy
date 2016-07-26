class Issue < ActiveRecord::Base
  belongs_to :version_test

  validates :link, presence: true


    def status
    	if self.available_for_test
    		return self.done ? 'success' : 'warning'
    	else
    		return 'danger'
    	end
	end
end
