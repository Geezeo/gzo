require "spec_helper"

describe "Geezeo accounts", :vcr do
  before(:each) do
    @geezeo = Geezeo.client(
      Geezeo.configuration.api_key, Geezeo.configuration.user_id
    )
  end

  it "gets a list of all accounts" do
    account = @geezeo.accounts.all.first

    account.id.should_not be_nil
  end

  it "gets a single account" do
    account_id = @geezeo.accounts.all.first.id
    account = @geezeo.accounts.find(account_id)

    account.id.should_not be_nil
  end

  it "gets the sum of all account balances" do
    balance = @geezeo.accounts.sum_of_balances

    balance.should be_kind_of(Float)
  end

  it "returns a list of its transactions" do
    account = @geezeo.accounts.all.first
    transaction = account.transactions.first

    transaction.id.should_not be_nil
  end

  it "returns a list of its recent transactions" do
    account = @geezeo.accounts.all.first
    transaction = account.recent_transactions.first

    transaction.id.should_not be_nil
  end

  # TODO: make this test less brittle
  it "returns a list of all transactions after the transaction_id passed" do
    last_transaction_id = "d6bac79d-935a-4416-83a0-24bdd83fbc1c"
    account = @geezeo.accounts.all.first
    transaction = account.transactions(last_transaction_id).first
    last_transaction = account.transactions(last_transaction_id).last

    transaction.id.should_not be_nil
    last_transaction.id.should eq("4471f06a-a3ac-4d7c-95c3-402203623c25")
  end
end

describe "Geezeo transactions", :vcr do
  before(:each) do
    @geezeo = Geezeo.client(
      Geezeo.configuration.api_key, Geezeo.configuration.user_id
    )
  end

  it "gets a list of all transactions" do
    transaction = @geezeo.transactions.all.first

    transaction.id.should_not be_nil
  end

  it "gets a list of all recent transactions" do
    transaction = @geezeo.transactions.all(:recent).first

    transaction.id.should_not be_nil
  end

  it "gets a single page of transactions" do
    account = @geezeo.accounts.all.first
    transaction = @geezeo.transactions.find(account).first

    transaction.id.should_not be_nil
  end
end

describe "Geezeo user", :vcr do
  before(:each) do
    @geezeo = Geezeo.client(
      Geezeo.configuration.api_key, Geezeo.configuration.user_id
    )
  end

  it "returns user data" do
    user = @geezeo.user

    user.id.should be_kind_of(Integer)
    user.partner_customer_id.should be_kind_of(String)
    user.first_name.should be_kind_of(String)
    user.last_name.should be_kind_of(String)
  end
end
