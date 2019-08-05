class PlacesController < ApplicationController
  def index 
    @places = Place.all.order("created_at DESC").page(params[:page]).per_page(5)
  end

  def new 
    @place = Place.new
  end

  def create 
    Place.create(place_params) 
    redirect_to root_path
  end

  def new_user 
    @user = User.new 
  end 
  
  private 

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end


end
