module Geezeo
  module Adapters
    class User
      attr_reader :credentials

      def initialize(credentials)
        @credentials = credentials
      end

      def path
        "#{HOST}/users"
      end

      def me
        response = HTTParty.get("#{path}/#{credentials.user_id}",
          basic_auth: {username: credentials.api_key, password: ""})

        Geezeo::User.new(response)
      end
    end
  end
end
