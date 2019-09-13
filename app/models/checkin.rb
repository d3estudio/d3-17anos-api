class Checkin < ApplicationRecord
  belongs_to :guest
  after_create :notify

  def visited_at
    self.created_at.utc.iso8601
  end

  def self.create_from_tag(tag, sequence)
    guest = Guest.find_by(tag: tag)
    return nil unless guest
    self.create(guest: guest, seq: sequence)
  end

  def self.create_from_email(email)
    guest = Guest.find_by(email: email)
    guest = Guest.find_by(slug: email) unless guest
    return nil unless guest
    self.create(guest: guest)
  end

  private

  def notify
    CheckinChannel.notify_checkin(self)
  end
end
