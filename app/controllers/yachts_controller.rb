class YachtsController < ApplicationController
  def index
    @yachts = Yacht.all
  end

  def show
    @yacht = Yacht.find(params[:id])
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
