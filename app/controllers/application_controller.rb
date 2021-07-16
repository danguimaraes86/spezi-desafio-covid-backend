# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # We are using null_session since API's don't have a state/session
  # and we don't need to check CSRF Token
  protect_from_forgery with: :null_session

  private def render_json_reponse(status, data)
    render json: data,
           status: status
  end
end
