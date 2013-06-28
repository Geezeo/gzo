require "json"

require "geezeo/client"
require "geezeo/version"

module Geezeo
  class << self

    # Create a client
    #
    # == Examples
    #   Geezeo.client('api_key', 'user_id')
    #
    # @return [Geezeo::Base]
    def client(api_key, user_id)
      Geezeo::Client.new(api_key, user_id)
    end
  end
end
