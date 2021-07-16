# frozen_string_literal: true

require 'json'
require 'rest-client'

class BrasilIoApiFetcher
  define_method(:url) { Rails.application.config.brasil_io_base_url }
  define_method(:api_token) { Rails.application.config.brasil_io_api_token }

  def initialize(date)
    @date = date
  end

  def call
    response = RestClient::Request.execute(method: :get,
                                           url: "#{url}?place_type=state&date=#{@date}",
                                           headers: { authorization: "Token #{api_token}" })
    JSON.parse(response.body)['results']
  end
end
