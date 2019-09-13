require 'rails_helper'

RSpec.describe Checkin, type: :model do
  let(:guest) { create(:guest) }

  it "broadcasts on create" do
    datetime = DateTime.now

    expect{
      Checkin.create(guest: guest, created_at: datetime)
    }.to broadcast_to("checkin").from_channel(CheckinChannel).with({
      id: guest.id,
      slug: guest.slug,
      nickname: guest.nickname,
      picture: guest.picture,
      visitedAt: datetime.utc.iso8601,
    })
  end
end
