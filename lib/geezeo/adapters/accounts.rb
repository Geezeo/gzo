module Geezeo
  module Adapters
    class Accounts
      attr_reader :credentials

      def initialize(credentials)
        @credentials = credentials
      end

      def path
        "/accounts"
      end

      def all
        response = HTTParty.get("#{HOST}/users/#{credentials.user_id}#{path}",
          basic_auth: {username: credentials.api_key, password: ""})

        response["accounts"].map do |account|
          account["credentials"] = credentials
          Geezeo::Account.new(account)
        end
      end

      def sum_of_balances
        all.map{|account| account.balance.to_f}.reduce :+
      end
    end
  end
end
