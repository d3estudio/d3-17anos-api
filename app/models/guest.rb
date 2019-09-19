class Guest < ApplicationRecord
  geocoded_by :full_address
  after_validation :geocode

  before_validation :set_defaults

  enum bond: [
    "Funcionário",
    "Ex-funcionário",
    "Parceiro",
    "Cliente",
    "Ex-cliente",
    "Amigo",
    "Acompanhante",
  ]

  has_many :checkins

  def picture
    self.slug
  end

  def full_address
    [address, zip, city, state, "Brasil"].compact.join(', ')
  end

  def time_with
    return nil unless self.joined_at

    seconds_per_month = 60 * 60 * 24 * 30
    months = (self.joined_at - DateTime.now) / seconds_per_month
    months = months.abs.floor
    if months < 12 then
      return "#{months} MESES" if months > 1
      return "#{months} MES"
    end

    years = months / 12

    return "#{years} ANOS" if years > 1
    return "#{years} ANO"
  end

  def year_with
    return nil unless self.joined_at
    self.joined_at.year
  end

  private

  def set_defaults
  self.tag_nfc = self.tag_nfc.gsub(":", '').upcase() if self.tag_nfc.present?
  end
end
