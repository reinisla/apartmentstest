class UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @users = User.excludes(:id => current_user.id)
  end
  
  def new
   
  end
  
  
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created User." 
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    authorize! :read, Cpanel
  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
      flash[:notice] = "Successfully updated User."
      redirect_to cpanel_index_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :surname, :email, :location, :role_id, :avatar, :avatar_cache, :remover_avatar)
  end
end