class PlacesController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index 
    @places = Place.all.order("created_at DESC").page(params[:page]).per_page(5)
  end

  def new 
    @place = Place.new
  end

  def create 
    current_user.places.create(place_params) 
    redirect_to root_path
  end

  def new
    @place = Place.new 
  end 

  def new_user 
    @user = User.new 
  end 

  def show
    @place = Place.find(params[:id]) 
  end
  
  def edit 
    @place = Place.find(params[:id])
      if @place.user != current_user
        return render plain: 'Not Allowed', status: :forbidden
      end
  end

  def update
    @place = Place.find(params[:id])
    if @place.user != current_user 
        return render plain: 'Not Allowed', status: :forbidden 
    end
    @place.update_attributes(place_params)
    redirect_to place_path(params[:id])
  end

  def destroy
    @place = Place.find(params[:id]).destroy
    redirect_to root_path
  end 

  private 

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end


end
