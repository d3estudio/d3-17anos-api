class CheckinChannel < ApplicationCable::Channel
  CHANNEL = "checkin"

  def subscribed
    stream_from CHANNEL
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def self.notify_checkin(checkin)
    ActionCable.server.broadcast(CHANNEL, {
      id: checkin.guest.id,
      slug: checkin.guest.slug,
      nickname: checkin.guest.nickname,
      picture: checkin.guest.picture,
      visitedAt: checkin.visited_at
    })
  end
end
