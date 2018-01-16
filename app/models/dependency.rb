class Dependency < ActiveRecord::Base

	belongs_to :pre, class_name: "Test", foreign_key: 'pre_id'
	belongs_to :pos, class_name: "Test", foreign_key: 'pos_id'
	
	validates :pre_id, presence: true
	validates :pos_id, presence: true
     

end


