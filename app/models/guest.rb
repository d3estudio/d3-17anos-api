class Guest < ApplicationRecord
  before_validation :set_defaults

  enum bond: [
    "Funcionário",
    "Ex-funcionário",
    "Parceiro",
    "Cliente",
    "Ex-cliente",
    "Amigo",
  ]

  has_many :checkins

  def picture
    self.slug
  end

  def time_with
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

  private

  def set_defaults
  self.tag_nfc = self.tag_nfc.gsub(":", '').upcase() if self.tag_nfc.present?
  end
end
