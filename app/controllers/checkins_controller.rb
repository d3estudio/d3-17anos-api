class CheckinsController < ApplicationController
  def index
    @checkins = Checkin.select('DISTINCT ON (guest_id) checkins.guest_id, checkins.created_at')
  end

  def create
    slug = params.require(:slug)
    checkin = Checkin.create_from_slug(slug)
    if not checkin then
      return render json: { success: false, error: 'Not Found'}
    end
    render json: { success: true }
  end
end
