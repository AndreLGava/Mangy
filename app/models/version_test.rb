class VersionTest < ActiveRecord::Base
  belongs_to :version
  belongs_to :test

  has_many :issues, dependent: :destroy

  def done
  	return self.check ? 'success' : 'warning' 
  end
end
