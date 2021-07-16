# frozen_string_literal: true

class DadosAcumulados
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :date, type: Date

  embeds_many :uf_acumulado
end
