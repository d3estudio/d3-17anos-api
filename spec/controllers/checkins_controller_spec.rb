require 'rails_helper'

RSpec.describe CheckinsController, type: :request do
  let!(:checkin) { create(:checkin) }

  it "render checkins" do
    get "/checkins"

    expect(response.content_type).to eq "application/json"
    expect(response).to have_http_status :success
  end

  it "render checkins attributes" do
    get "/checkins"

    body = JSON.parse(response.body)
    checkins = body["checkins"]

    expect(checkins.size).to eq 1

    expect(checkins.first["visitedAt"]).to eq checkin.visited_at
    expect(checkins.first["id"]).to eq checkin.guest.id
    expect(checkins.first["slug"]).to eq checkin.guest.slug
    expect(checkins.first["nickname"]).to eq checkin.guest.nickname
    expect(checkins.first["picture"]).to eq checkin.guest.picture
  end

  # it "create guests" do
  #   get "/checkins/create/" + checkin.guest.slug

  #   expect(response.content_type).to eq "application/json"
  #   expect(response).to have_http_status :success
  # end

  # it "broadcasts on email" do
  #   expect{
  #     get "/checkins/create/" + checkin.guest.slug
  #   }.to broadcast_to("checkin").from_channel(CheckinChannel)
  # end
end
