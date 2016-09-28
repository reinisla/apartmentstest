class PostsController < ApplicationController
	before_action :find_property, only: [:destroy]
  def index
    authorize! :read, Cpanel
  	@user = User.find (params[:cpanel_id])
  	@properties = Property.where user_id: @user
  end

  def new
  end

  def edit
  end

  def destroy
  	@property.destroy
  	redirect_to cpanel_posts_path
  end

  private

  def find_property
  	@property = Property.find(params[:id])
  end
end
