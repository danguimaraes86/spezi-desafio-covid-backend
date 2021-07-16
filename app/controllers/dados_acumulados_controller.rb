# frozen_string_literal: true

class DadosAcumuladosController < ApplicationController
  before_action :set_search_date, only: %i[index]

  def index
    dados_acumulados = if DadosAcumulados.where(date: @search_date).exists?
                         DadosAcumulados.find_by(date: @search_date)
                       else
                         CreateDadosAcumuladosService.new(@search_date).call
                       end
    render_json_reponse(:ok, dados_acumulados)
  end

  private def set_search_date
    @search_date = if params['date'].nil? || params['date'] == Date.current.to_s
                     (Date.current - 1).to_s
                   else
                     params['date']
                   end
  end
end
