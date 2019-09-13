class Guest < ApplicationRecord
  enum bond: [ :member, :partner, :client, :escort ]

  has_many :checkins

  def picture
    self.slug
  end
end
