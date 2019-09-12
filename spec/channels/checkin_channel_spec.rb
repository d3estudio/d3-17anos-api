require "rails_helper"

RSpec.describe CheckinChannel, type: :channel do
  before do
    # initialize connection with identifiers
    stub_connection
  end

  it "accepts" do
    subscribe
    expect(subscription).to be_confirmed
  end
end