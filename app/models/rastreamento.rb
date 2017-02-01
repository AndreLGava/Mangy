class Rastreamento < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :issue
  belongs_to :status
end
