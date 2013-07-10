require "spec_helper"

describe Geezeo::Client do
  it "raises an error if passed invalid credentials" do
    expect{Geezeo::Client.new(nil, "user_id")}.to raise_error
    expect{Geezeo::Client.new("api-key", nil)}.to raise_error
    expect{Geezeo::Client.new(nil, nil)}.to raise_error
  end
end
