class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @bookings = current_user.bookings.order(starts_at: :desc, id: :desc)
  end
end