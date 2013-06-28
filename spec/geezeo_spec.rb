require "spec_helper"

describe "Geezeo accounts" do
  before(:each) do
    @client = Geezeo.client(credentials[:api_key], credentials[:user_id])
  end

  it "gets a list of accounts" do
    @account = @client.accounts.all.first

    @account.id.should_not be_nil
  end
end
