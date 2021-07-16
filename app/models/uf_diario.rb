# frozen_string_literal: true

class UfDiario
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :uf, type: String
  field :casos_dia, type: Integer
  field :mortes_dia, type: Integer

  embedded_in :dados_diarios
end
