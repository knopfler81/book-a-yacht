class BookingsController < ApplicationController

  before_filter :sanitize_booking_params
  before_action :find_yacht, only: [:create]


  def show
    @booking = Booking.find(params[:id])
    @yacht = @booking.yacht

  end

  def create
    @booking = Booking.new(booking_params)
    @booking.yacht = @yacht
    @booking.save!
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :guests, :total_price, :yacht_id, :user_id)
  end

  def find_yacht
    @yacht = Yacht.find(params[:yacht_id])
  end


  def sanitize_booking_params
    params[:guests] = params[:guests].to_i
  end
end
