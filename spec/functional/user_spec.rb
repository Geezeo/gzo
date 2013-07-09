require "spec_helper"

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
