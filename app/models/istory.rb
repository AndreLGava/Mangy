class Istory < ActiveRecord::Base
  belongs_to :sprint
  belongs_to :category
end
