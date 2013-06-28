module Geezeo
  module Adapters
    class Accounts
      HOST = "https://beta-geezeosandbox.geezeo.com/api/v1"
      PATH = "/accounts"

      attr_reader :credentials

      def initialize(credentials)
        @credentials = credentials
      end

      def all
        response = HTTParty.get("#{HOST}/users/#{credentials.user_id}#{PATH}",
          basic_auth: {username: credentials.api_key, password: ""})
      end
    end
  end
end