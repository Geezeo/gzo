module Geezeo
  module Adapters
    class Accounts
      attr_reader :credentials

      include Requestable

      def initialize(credentials)
        @credentials = credentials
      end

      def base_uri
        "#{HOST}/users/#{credentials.user_id}/accounts"
      end

      def find(account_id)
        response = request(:get, "#{base_uri}/#{account_id}")
        
        response["credentials"] = credentials
        Geezeo::Account.new(response)
      end

      def all
        response = request(:get, base_uri)

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
