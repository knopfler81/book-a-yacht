class BookingsController < ApplicationController

  before_action :find_yacht, only: [:create]

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.yacht = @yacht
    @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :guests, :total_price, :yacht_id, :user_id)
  end

  def find_yacht
    @yacht = Yacht.find(params[:yacht_id])
  end
end
