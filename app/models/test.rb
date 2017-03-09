class Test < ActiveRecord::Base

	include RankedModel
  	ranks :row_order

	has_many :version_tests, dependent: :destroy
	has_many :issues, :through => :version_tests

	belongs_to :category

	validates :description, presence: true
	validates :expected_result, presence: true
	validates :status, presence: true
	validates :category, presence: true

	before_create :set_row_order

	enum status: {Irrelevante: 0, Importante: 1, Crítico: 2 }

	def set_row_order
	  last_row_order = Test.maximum(:row_order)
	  self.row_order = last_row_order.to_i + 1
	end
	
end
