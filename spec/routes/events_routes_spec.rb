require 'rails_helper'

RSpec.describe "routing", type: 'routing' do
  it "should go to events#index" do
    expect(get: "/").to route_to(controller: "events", action: "index")
  end
  it "should go to sign in page" do
    expect(get: "/signin").to route_to(controller: "sessions", action: "new")
  end
end