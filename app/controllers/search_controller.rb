class SearchController < ApplicationController

  def index	
  	@properties = Property.where(["LOWER(name) LIKE ? OR LOWER(surname) LIKE ? OR LOWER(address) LIKE ? OR LOWER(city) LIKE ? OR LOWER(housename) LIKE ?" , "%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%"])
  	@flats = Flat.where(["LOWER(name) LIKE ? OR LOWER(surname) LIKE ?","%#{params[:search]}%","%#{params[:search]}%"])
  end
end
