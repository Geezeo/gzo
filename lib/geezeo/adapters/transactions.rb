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
        transactions = accounts.map{|account| find_all_by_account(account)}.flatten

        sort_by_posted_at(transactions)
      end

      def find_all_by_account(account)
        pages = total_pages(account)
        results = []

        pages.times do |page|
          results << find_by_account(account, page)
        end

        results
      end

      def find_by_account(account, page=1)
        response = request(account, page)

        if response["transactions"]
          results = response["transactions"].map do |transaction|
            Geezeo::Transaction.new(transaction["transaction"])
          end
        else
          results = []
        end

        results.compact
      end

      def posted_at(transaction)
        Time.parse(transaction.posted_at) rescue Time.new(0)
      end

      def recent
        accounts = Geezeo::Adapters::Accounts.new(credentials).all
        transactions = accounts.map{|account| find_by_account(account)}.flatten

        sort_by_posted_at(transactions)
      end

      def request(account, page=1)
        uri = "#{HOST}/users/#{credentials.user_id}/#{path(account)}?page=#{page}"
        HTTParty.get(uri, basic_auth:
                            {username: credentials.api_key, password: ""})
      end

      def sort_by_posted_at(transactions)
        transactions.sort_by{|transaction| posted_at(transaction)}.reverse
      end

      def total_pages(account)
        response = request(account)
        response["pages"]["total_pages"].to_i
      end
    end
  end
end
