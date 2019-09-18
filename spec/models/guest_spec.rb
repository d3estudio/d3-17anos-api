require 'rails_helper'

RSpec.describe Guest, type: :model do
  it do
    should define_enum_for(:bond).
      with_values([
        "Funcionário",
        "Ex-funcionário",
        "Parceiro",
        "Cliente",
        "Ex-cliente",
        "Amigo",
        "Acompanhante"
      ])
  end

  it 'purifies tag' do
    guest = create(:guest, tag_nfc: "04:A0:3a:82:58:49:80")
    expect(guest.tag_nfc).to eq "04A03A82584980"
  end
end
