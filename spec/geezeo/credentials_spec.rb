require "spec_helper"

describe Geezeo::Credentials do
  describe "valid" do
    it "should validate if passed api_key and user_id" do
      Geezeo::Credentials.new("api-key", "user-id").should be_valid
    end
    
    it "should not validate if api_key and/or user_id are nil" do
      Geezeo::Credentials.new(nil, "user-id").should_not be_valid
      Geezeo::Credentials.new("api-key", nil).should_not be_valid
      Geezeo::Credentials.new(nil, nil).should_not be_valid
    end
  end
end
