class GuestsController < ApplicationController
  def index
    @guests = Guest.all
    expires_now
  end
end
