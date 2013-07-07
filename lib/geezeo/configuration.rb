module Geezeo
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :api_key, :user_id

    def initialize
      @api_key, @user_id = "", ""
    end
  end
end

