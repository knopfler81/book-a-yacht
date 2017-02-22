class YachtsController < ApplicationController
  def index
    # @yachts = Yacht.all
    @yachts = Yacht.near(params[:query][:location], 30).where('capacity >= ?', params[:query][:guests])
    # remplacer par le résultat de la recherche, on doit pouvoir filtrer avec les dates aussi

    @hash = Gmaps4rails.build_markers(@yachts) do |yacht, marker|
      marker.lat yacht.latitude
      marker.lng yacht.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @yacht = Yacht.find(params[:id])

    @hash = Gmaps4rails.build_markers(@yacht) do |yacht, marker|
      marker.lat yacht.latitude
      marker.lng yacht.longitude
      # marker.infowindow render_to_string(partial: "/yachts/map_box", locals: { flat: flat })
    end

    # ajouter les reviews
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
end
