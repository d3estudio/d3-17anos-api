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

  private

  def set_defaults
    self.tag_nfc = self.tag_nfc.gsub(":", '').upcase() if self.tag_nfc.present?
  end
end
