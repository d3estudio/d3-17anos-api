class CheckinChannel < ApplicationCable::Channel
  def subscribed
    stream_from "checkin"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
