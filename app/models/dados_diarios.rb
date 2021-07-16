# frozen_string_literal: true

class DadosDiarios
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  store_in collection: 'dados_diarios', database: 'spezi-desafio-covid'

  field :date, type: String

  embeds_many :uf_diario
end
