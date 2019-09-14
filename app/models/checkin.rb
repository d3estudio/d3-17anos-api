class Checkin < ApplicationRecord
  belongs_to :guest
  after_create :notify

  def visited_at
    self.created_at.utc.iso8601
  end

  def self.create_from_tag(tag, sequence)
    guest = Guest.find_by(tag_nfc: tag.upcase())
    return nil unless guest
    self.create(guest: guest, seq: sequence)
  end

  def self.create_from_slug(slug)
    guest = Guest.find_by(slug: slug)
    return nil unless guest
    guest = self.create(guest: guest)
  end

  private

  def notify
    CheckinChannel.notify_checkin(self)
  end
end
