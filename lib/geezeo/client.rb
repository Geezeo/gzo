module Geezeo
  class Client
    attr_reader :credentials

    def initialize(api_key, user_id)
      @credentials = Credentials.new(api_key, user_id)
    end

    def accounts
      @accounts ||= Geezeo::Adapters::Accounts.new(credentials)
    end
  end
end
