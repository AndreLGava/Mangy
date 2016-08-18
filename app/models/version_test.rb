class VersionTest < ActiveRecord::Base
  belongs_to :version
  belongs_to :test

  has_many :issues, dependent: :destroy

  validates :version_id, presence: true
  validates :test_id, presence: true
  validates_uniqueness_of :version_id, scope: :test_id

  def done
  	return self.check ? 'success' : 'warning' 
  end
end
