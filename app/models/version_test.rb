class VersionTest < ActiveRecord::Base
  belongs_to :version
  belongs_to :test
end
