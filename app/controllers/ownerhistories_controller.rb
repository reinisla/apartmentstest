class OwnerhistoriesController < ApplicationController
  	before_action :find_flat, only: [:create, :edit, :update, :destroy]
	before_action :find_ownerhistory, only: [ :edit, :update, :destroy]
	before_action :find_property, only: [:create, :edit, :update, :destroy]
	
	def create
		 
		@ownerhistory = @flat.ownerhistories.build(ownerhistories_params)
		@ownerhistory.user = current_user
		@ownerhistory.save
		redirect_to property_flat_path(@property,@flat)
	end

	def destroy
		@ownerhistory.destroy
		redirect_to property_flat_path(@property,@flat)
	end
	def show
	end

	def edit
			
	end

	def update
		 @ownerhistory.update(ownerhistories_params)
    
	     if @ownerhistory.save
	        redirect_to property_flat_path(@flat)
	     else
	        render "edit" 
	     end
	end

	private

		def ownerhistories_params
			params.require(:ownerhistory).permit(:name, :surname, :email, :move_in_date, :move_out_date)	
		end
		
		def find_flat
			@flat = Flat.find(params[:flat_id])
		end
		def find_ownerhistory
			@ownerhistory = Ownerhistory.find(params[:id])
		end
		def find_property
			@property = Property.find(params[:property_id])
		end
	
end


