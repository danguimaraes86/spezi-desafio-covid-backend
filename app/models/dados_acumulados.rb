# frozen_string_literal: true

class DadosAcumulados
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  store_in collection: 'dados_acumulados', database: 'spezi-desafio-covid'

  field :date, type: String

  embeds_many :uf_acumulado
end
