class BookingsController < ApplicationController

  before_filter :sanitize_booking_params
  before_action :find_yacht, only: [:create]
  before_action :find_booking, only: [:show, :update, :pay ]


  def show
    @yacht = @booking.yacht
    @review = Review.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.yacht = @yacht
    @booking.save!
    redirect_to booking_path(@booking)
  end


  def update
    if @booking.update(booking_params)
      respond_to do |format|
             format.html { redirect_to booking_path(@booking), notice: "Payement successed" }
             format.js   # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      redirect_to @booking, error: "Payement failed"
    end
  end

  def pay
    @booking.payment
    @review = Review.new
  end

  private

  def find_booking
     @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :guests, :total_price, :yacht_id, :user_id, :payment_status)
  end

  def find_yacht
    @yacht = Yacht.find(params[:yacht_id])
  end

  def sanitize_booking_params
    params[:guests] = params[:guests].to_i
  end
end
