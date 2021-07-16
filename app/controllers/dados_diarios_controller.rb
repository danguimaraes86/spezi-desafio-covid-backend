# frozen_string_literal: true

class DadosDiariosController < ApplicationController
  before_action :set_search_date, only: %i[index]

  def index
    dados_diarios = if DadosDiarios.where(date: @search_date).exists?
                      DadosDiarios.find_by(date: @search_date)
                    else
                      CreateDadosDiariosService.new(@search_date).call
                    end
    render_json_reponse(:ok, dados_diarios)
  end

  private def set_search_date
    @search_date = if params['date'].nil? || params['date'] == Date.current.to_s
                     (Date.current - 1).to_s
                   else
                     params['date']
                   end
  end
end
