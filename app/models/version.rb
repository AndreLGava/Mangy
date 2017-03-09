class Version < ActiveRecord::Base
	has_many :version_tests, dependent: :destroy
	has_many :issues, through: :version_tests, class_name: 'Issue'
	attr_accessor :category

	belongs_to :sistem
	
	validates :responsable, presence: true
	validates :used_user, presence: true
	validates :sistem, presence: true
	validates :start, presence: true

	def done_version
		return self.finish? ? 'info' : 'danger'
	end
	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |test|
	      csv << test.attributes.values_at(*column_names)
	    end
	  end
	end

	def processa(sinal)
		faltando = self.version_tests.group('date(updated_at)').where(check: true).count(:updated_at).values
		faltou = []
		processados = []
		total = 0
		faltando.each do |f|
			total += f
			faltou << self.version_tests.count - total
			processados << total
		end
		return sinal == "soma" ? processados : faltou
	end

	def version_progress
		progress = {}
		progress['updated'] = self.version_tests.group('date(updated_at)').where(check: true).map(&:updated_at).map(&:to_date).map(&:to_s)
		progress['count'] = self.version_tests.group('date(updated_at)').where(check: true).count(:updated_at).values
		progress['faltante'] = self.processa("sub")
		progress['processado'] = self.processa("soma")
	return progress
	end

	def chart
		variable = {}
		variable['title'] = 'Execução de testes'
		variable['subtitle'] = 'Relação de testes processados, faltantes e executados por dia'
		variable['yAxis'] = ''
		variable['description'] = 'Testes'
		variable['categories'] = nil
		variable['data'] = version_progress
	return variable.to_json.html_safe
	end
end
