class YachtsController < ApplicationController
  def index
    @yachts = Yacht.all
    # @yachts = Yacht.near(params[:query][:location], 30).where('capacity >= ?', params[:query][:guests])
    filter_yatchs

    # remplacer par le résultat de la recherche, on doit pouvoir filtrer avec les dates aussi
    @hash = Gmaps4rails.build_markers(@yachts) do |yacht, marker|
      marker.lat yacht.latitude
      marker.lng yacht.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @yacht = Yacht.find(params[:id])
    @booking = Booking.new
    @hash = Gmaps4rails.build_markers(@yacht) do |yacht, marker|
      marker.lat yacht.latitude
      marker.lng yacht.longitude
      # marker.infowindow render_to_string(partial: "/yachts/map_box", locals: { flat: flat })
    end
  end

  def new
    @yacht = Yacht.new
  end

  def create
    @yacht = Yacht.new(yacht_params)
    @yacht.user = current_user
    if @yacht.save
      redirect_to yacht_path(@yacht)
    else
      render :new
    end
  end

  def edit
    @yacht = Yacht.find(params[:id])
  end

  def update
    @yacht = Yacht.find(params[:id])
    if @yacht.update(yacht_params)
      redirect_to yacht_path(@yacht)
    else
      render :edit
    end
  end

  def destroy
    @yacht = Yacht.find(params[:id])
    @yacht.destroy
    redirect_to my_profile_path
  end


  private

  def yacht_params
    params.require(:yacht).permit(:name, :description, :location, :price, :length, :width, :capacity, :air_c, :crew, :cabins, photos: [])
  end

  def filter_yatchs
    @yachts = @yachts.near(params[:query][:location], 20) if params[:query][:location].present?
    @yachts = @yachts.where('price >= ?', params[:query][:price_min]) if params[:query][:price_min].present?
    @yachts = @yachts.where('price <= ?', params[:query][:price_max]) if params[:query][:price_max].present?
    @yachts = @yachts.where('air_c = ?', params[:query][:air_c]) if params[:query][:air_c].present?
    @yachts = @yachts.where('capacity >= ?', params[:query][:guests]) if params[:query][:guests].present?
    @yachts = @yachts.where('cabins >= ?', params[:query][:cabins]) if params[:query][:cabins].present?
    @date_range = (params[:query][:start_date]..params[:query][:end_date]) if params[:query][:start_date].present? && params[:query][:end_date].present?
    @yachts = @yachts.select {|yacht| yacht.available_at(@date_range)} if params[:query][:start_date].present? && params[:query][:end_date].present?
  end
end
