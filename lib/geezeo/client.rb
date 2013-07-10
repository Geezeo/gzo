module Geezeo
  class Client
    attr_reader :credentials

    def initialize(api_key, user_id)
      @credentials = Credentials.new(api_key, user_id)

      raise "You must supply an api_key and user_id" unless @credentials.valid?
    end

    def accounts
      @accounts ||= Geezeo::Adapters::Accounts.new(credentials)
    end

    def transactions
      @transactions ||= Geezeo::Adapters::Transactions.new(credentials)
    end

    def user
      @user ||= Geezeo::Adapters::User.new(credentials).me
    end
  end
end
