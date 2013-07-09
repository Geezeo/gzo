require "spec_helper"

describe "Geezeo transactions", :vcr do
  before(:each) do
    @geezeo = Geezeo.client(
      Geezeo.configuration.api_key, Geezeo.configuration.user_id
    )
  end

  it "gets a list of all transactions" do
    transaction = @geezeo.transactions.all.first

    transaction.id.should be_kind_of(String)
    transaction.nickname.should be_kind_of(String)
  end

  it "gets a list of all recent transactions" do
    transaction = @geezeo.transactions.all(:recent).first

    transaction.id.should be_kind_of(String)
    transaction.nickname.should be_kind_of(String)
  end

  it "gets a single page of transactions" do
    account = @geezeo.accounts.all.first
    transaction = @geezeo.transactions.find(account).first

    transaction.id.should be_kind_of(String)
    transaction.nickname.should be_kind_of(String)
  end
end
