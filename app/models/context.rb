class Context < ActiveRecord::Base

	belongs_to :origin, class_name: "Test", foreign_key: 'origin_id_id'
	belongs_to :destiny, class_name: "Test", foreign_key: 'destiny_id_id'
	validates :origin_id_id, presence: true
	validates :destiny_id_id, presence: true
     

end


