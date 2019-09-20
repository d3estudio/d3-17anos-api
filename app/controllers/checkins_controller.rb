class CheckinsController < ApplicationController
  def index
    @checkins = Checkin.order(created_at: :asc).distinct(:guest_id)
  end

  def create
    slug = params.require(:slug)
    checkin = Checkin.create_from_slug(slug)
    if not checkin then
      return render json: { success: false, error: 'Not Found'}
    end
    expires_now
    render json: { success: true }
  end
end
