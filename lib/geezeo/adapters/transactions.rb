module Geezeo
  module Adapters
    class Transactions
      attr_reader :credentials

      def initialize(credentials)
        @credentials = credentials
      end

      def path
        "/transactions"
      end 

      def all(accounts)
        accounts.map{|account| find_by_account(account)}.flatten
      end

      def find_by_account(account)
        response = HTTParty.get("#{HOST}/users/#{credentials.user_id}/accounts/#{account.id}/#{path}",
          basic_auth: {username: credentials.api_key, password: ""})
        response["transactions"].map{|transaction| Hashie::Mash.new(transaction["transaction"])}
      end           
    end
  end
end