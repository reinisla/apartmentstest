class CpanelController < ApplicationController
	before_action :find_user, only: [:create,:show, :edit, :destroy]
  def index
    @orderby = "LOWER(name) asc"
    authorize! :read, Cpanel
  	@users = User.all.includes(:properties,:flats,:role).order(@orderby)
  
  end

  def edit
    authorize! :update, @property
  end

  def new
   
  end

  def create 

    @user.update_attributes(user_params)
    
    if @user.update
         redirect_to cpanels_path
      else
        render "new" 
      end 
  end


  def destroy
  	@user.destroy
    redirect_to cpanel_index_path
  end

  def show
  	
  end

  private
  
  def find_user
  	@user = User.find(params[:id])
  end

   def user_params
    params.require(:user).permit(:name, :surname, :email, :location, :password, :admin)
  end
end
