class PhotosController < ApplicationController
  before_action :authenticate_user! 

  def create 
    @places = Place.find(params[:place_id])
    # @photos = Photo.new
    redirect_to place_path(@places)
  end

  private 

  def photo_params 
    params.require(:photos).permit(:caption)
  end
end
