class ReviewsController < ApplicationController

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    @yacht = @booking.yacht

    if @review.save
      flash[:notice] = 'Review was successfully created.'
      redirect_to @booking
    else
      flash[:notice] = "Error creating review: #{@review.errors}"
      render 'bookings/show'
    end
  end
  private

    def review_params
      params.require(:review).permit(:rating, :description)
    end
end