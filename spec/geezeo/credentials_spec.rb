require "spec_helper"

describe Geezeo::Credentials do
  describe "valid" do
    it "should return true if passed api_key and user_id" do
      Geezeo::Credentials.new("api-key", "user-id").should be_valid
    end
    
    it "should raise an error if api_key and/or user_id are nil" do
      expect{Geezeo::Credentials.new(nil, "user-id")}.to raise_error
      expect{Geezeo::Credentials.new("api-key", nil)}.to raise_error
      expect{Geezeo::Credentials.new(nil, nil)}.to raise_error
    end
  end
end
