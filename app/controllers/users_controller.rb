class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 
    @places = @user.places
    @comments = @user.comments 
  end  
end
