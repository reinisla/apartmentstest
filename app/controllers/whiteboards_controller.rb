class WhiteboardsController < ApplicationController
  	before_action :find_property, only: [:create, :edit, :update, :destroy]
	before_action :find_whiteboard, only: [ :edit, :update, :destroy]
	
	def create 
		@whiteboard = @property.whiteboards.build(whiteboards_params)
		@whiteboard.user = current_user
		@whiteboard.save

		redirect_to property_path(@property)
	end

	def destroy
		@whiteboard.destroy
		redirect_to property_path(@property)
	end

	def edit
			
	end

	def update
		 @whiteboard.update(whiteboards_params)
    
	     if @whiteboard.save
	        redirect_to property_path(@property)
	     else
	        render "edit" 
	     end
	end

	private

		def whiteboards_params
			params.require(:whiteboard).permit(:content)	
		end
		
		def find_property
			@property = Property.find(params[:property_id])
		end
		def find_whiteboard
			@whiteboard = Whiteboard.find(params[:id])
		end
	
end
