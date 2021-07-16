# frozen_string_literal: true

class UfAcumulado
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :uf, type: String
  field :casos_total, type: Integer
  field :mortes_total, type: Integer

  embedded_in :dados_acumulados
end
