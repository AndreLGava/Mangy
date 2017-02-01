class CategorySystem < ActiveRecord::Base
  belongs_to :sistem
  belongs_to :category
end
