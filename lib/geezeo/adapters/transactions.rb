module Geezeo
  module Adapters
    class Transactions
      attr_reader :credentials

      def initialize(credentials)
        @credentials = credentials
      end

      def path(account)
        "/accounts/#{account.id}/transactions"
      end 

      def all
        accounts = Geezeo::Adapters::Accounts.new(credentials).all
        accounts.map{|account| find_by_account(account)}.flatten
      end

      def find_by_account(account)
        response = HTTParty.get("#{HOST}/users/#{credentials.user_id}/#{path(account)}",
          basic_auth: {username: credentials.api_key, password: ""})
        
        response["transactions"].map do |transaction|
          Geezeo::Transaction.new(transaction["transaction"])
        end
      end

      def posted_at(transaction)
        Time.parse(transaction.posted_at)
      end

      def recent(period=3)
        recents = all.map do |transaction| 
          transaction if posted_at(transaction) > period.days.ago
        end

        recents.sort_by{|transaction| posted_at(transaction)}.reverse
      end
    end
  end
end
