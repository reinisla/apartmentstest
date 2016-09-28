class MainhistoriesController < ApplicationController
	before_action :find_flat, only: [:new, :create, :edit, :update, :destroy]
	before_action :find_mainhistory, only: [ :edit, :update, :destroy]
	before_action :find_property, only: [:new, :create, :edit, :update, :destroy]
	
	def new
		@mainhistory = Mainhistory.new	
	end
	def create 
		@mainhistory = @flat.mainhistories.build(mainhistories_params)
		@mainhistory.save
		redirect_to property_flat_path(@property,@flat)
	end

	def destroy
		@mainhistory.destroy
		redirect_to property_flat_path(@property,@flat)
	end

	def show
	end

	def edit		
	end

	def update
		 @mainhistory.update(mainhistories_params)
    
	     if @mainhistory.save
	        redirect_to property_flat_path(@property,@flat)
	     else
	        render "edit" 
	     end
	end

	private

		def mainhistories_params
			params.require(:mainhistory).permit(:problem,:name, :surname, :fix_date)	
		end	
		def find_flat
			@flat = Flat.find(params[:flat_id])
		end
		def find_mainhistory
			@mainhistory = Mainhistory.find(params[:id])
		end
		def find_property
			@property = Property.find(params[:property_id])
		end
end
