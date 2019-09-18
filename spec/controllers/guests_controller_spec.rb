require 'rails_helper'

RSpec.describe GuestsController, type: :request do
  let!(:guest) { create(:guest) }

  it "render guests" do
    get "/guests"

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status :success
  end

  it "render guests attributes" do
    get "/guests"

    body = JSON.parse(response.body)
    guests = body["guests"]

    expect(guests.size).to eq 1

    expect(guests.first["slug"]).to eq guest.slug
    expect(guests.first["name"]).to eq guest.name
    expect(guests.first["email"]).to eq guest.email
    expect(guests.first["phone"]).to eq guest.phone
    expect(guests.first["nickname"]).to eq guest.nickname
    expect(guests.first["tagNfc"]).to eq guest.tag_nfc
    expect(guests.first["description"]).to eq guest.description
    expect(guests.first["greeting"]).to eq guest.greeting
    expect(guests.first["bond"]).to eq guest.bond
    expect(guests.first["address"]).to eq guest.address
    expect(guests.first["addressNumber"]).to eq guest.address_number
    expect(guests.first["addressComplement"]).to eq guest.address_complement
    expect(guests.first["zip"]).to eq guest.zip
    expect(guests.first["city"]).to eq guest.city
    expect(guests.first["state"]).to eq guest.state
    expect(guests.first["latitude"]).to eq guest.latitude.to_s
    expect(guests.first["longitude"]).to eq guest.longitude.to_s
  end
end
