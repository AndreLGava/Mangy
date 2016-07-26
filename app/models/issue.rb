class Issue < ActiveRecord::Base
  belongs_to :version_test

  validates :link, presence: true
end
