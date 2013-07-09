module Geezeo
  class Credentials
    attr_accessor :api_key, :user_id

    def initialize(api_key, user_id)
      @api_key, @user_id = api_key, user_id
      raise "You must supply an api_key and user_id" unless valid?
    end

    def valid?
      api_key && user_id
    end
  end
end
