# frozen_string_literal: true

class CreateDadosAcumuladosService
  def initialize(date)
    @date = date
  end

  def call
    dados_acumulados = DadosAcumulados.create({ date: @date })

    resultado = BrasilIoApiFetcher.new(@date).call
    resultado.each do |estado|
      UfAcumulado.create({
                           uf: estado['state'],
                           casos_total: estado['last_available_confirmed'],
                           mortes_total: estado['last_available_deaths'],
                           dados_acumulados: dados_acumulados
                         })
    end
    dados_acumulados
  end
end
