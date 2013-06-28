module Geezeo
  module Adapters
    class Accounts
      attr_reader :credentials

      def initialize(credentials)
        @credentials = credentials
      end

      def all
        response = HTTParty.get("#{HOST}/users/#{credentials.user_id}#{path}",
          basic_auth: {username: credentials.api_key, password: ""})
        response["accounts"].map{|x| Hashie::Mash.new(x)}
      end

      def path
        "/accounts"
      end
    end
  end
end