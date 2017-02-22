class BookingsController < ApplicationController

  def create
    @booking = Booking.create(params_booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :guests, :total_price, :yacht_id, :user_id)
  end
end
