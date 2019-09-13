class Guest < ApplicationRecord
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
end
