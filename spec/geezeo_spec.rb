require "spec_helper"

describe "Geezeo accounts" do
  before(:each) do
    @geezeo = Geezeo.client(credentials["api_key"], credentials["user_id"])
  end

  it "gets a list of accounts" do
    account = @geezeo.accounts.all.first

    account.id.should_not be_nil
  end

  it "gets the sum of all account balances" do
    balance = @geezeo.accounts.sum_of_balances

    balance.should be_kind_of(Float)
  end
end
