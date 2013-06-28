require "spec_helper"

describe Geezeo::Client do
  before(:each) do
    @client = Geezeo::Client.new(credentials)
  end

  it "gets a list of accounts" do
    @account = @client.accounts.all.first

    @account.id.should_not be_nil
  end
end
