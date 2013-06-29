require "spec_helper"

describe "Geezeo accounts" do
  before(:each) do
    @geezeo = Geezeo.client(credentials["api_key"], credentials["user_id"])
  end

  it "gets a list of all accounts" do
    account = @geezeo.accounts.all.first

    account.id.should_not be_nil
  end

  it "gets the sum of all account balances" do
    balance = @geezeo.accounts.sum_of_balances

    balance.should be_kind_of(Float)
  end

  it "returns a list of its transactions" do
    account = @geezeo.accounts.all.first
    transaction = account.transactions.first

    #binding.pry

    transaction.id.should_not be_nil
  end
end

describe "Geezeo transactions" do
  before(:each) do
    @geezeo = Geezeo.client(credentials["api_key"], credentials["user_id"])
  end

  it "gets a list of all transactions" do
    transaction = @geezeo.transactions.all.first

    transaction.id.should_not be_nil
  end

  it "gets a list of all recent transactions" do
    transaction = @geezeo.transactions.recent.first

    transaction.id.should_not be_nil
  end

  it "gets a single page of transactions" do
    account = @geezeo.accounts.all.first
    transaction = @geezeo.transactions.find_by_account(account).first

    transaction.id.should_not be_nil
  end
end
