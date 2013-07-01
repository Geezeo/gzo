require "hashie"
require "httparty"
require "json"

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
    #   Geezeo.client('api_key', 'user_id')
    #
    # @return [Geezeo::Client]
    def client(api_key, user_id)
      Geezeo::Client.new(api_key, user_id)
    end
  end
end
