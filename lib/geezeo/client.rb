module Geezeo
  class Client

    def initialize(api_key, user_id)
      @api_key, @user_id = api_key, user_id
    end

    def accounts
      @accounts ||= Geezeo::Adapters::Accounts.new
    end
  end
end
