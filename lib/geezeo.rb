require "hashie"
require "httparty"
require "json"

require "geezeo/configuration"

require "geezeo/credentials"
require "geezeo/client"
require "geezeo/host"
require "geezeo/version"

require "geezeo/adapters/accounts"
require "geezeo/adapters/transactions"
require "geezeo/adapters/user"

require "geezeo/models/account"
require "geezeo/models/transaction"
require "geezeo/models/user"

module Geezeo
  class << self

    # Create a client
    #
    # == Examples
    #   Geezeo.client("api_key", "user_id")
    #
    # @return [Geezeo::Client]
    def client(api_key, user_id)
      Geezeo::Client.new(api_key, user_id)
    end

    # Create a client with local credentials
    #
    # == Examples
    #   Geezeo.c
    #
    # @return [Geezeo::Client]
    def c
      require "geezeo/local_credentials"
      Geezeo::Client.new(
        Geezeo.configuration.api_key, Geezeo.configuration.user_id
      )
    end
  end
end
