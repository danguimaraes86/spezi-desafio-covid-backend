# frozen_string_literal: true

class CreateDadosDiariosService
  def initialize(date)
    @date = date
  end

  def call
    dados_diarios = DadosDiarios.create({ date: @date })

    resultado = BrasilIoApiFetcher.new(@date).call
    resultado.each do |estado|
      UfDiario.create({
                        uf: estado['state'],
                        casos_dia: estado['new_confirmed'],
                        mortes_dia: estado['new_deaths'],
                        dados_diarios: dados_diarios
                      })
    end
    dados_diarios
  end
end
