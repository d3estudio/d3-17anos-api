class CheckinsController < ApplicationController
  def index
    @checkins = Checkin.select('DISTINCT ON (guest_id) checkins.guest_id, checkins.created_at')
  end
end
