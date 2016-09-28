class RepliesController < ApplicationController
	before_action :find_ticket, only: [:create, :edit, :update, :destroy]
	before_action :find_reply, only: [ :edit, :update, :destroy]
	
	def create 
		@reply = @ticket.replies.build(replies_params)
		@reply.user = current_user
		@reply.save

		redirect_to ticket_path(@ticket)
	end

	def destroy
		@reply.destroy
		redirect_to ticket_path(@ticket)
	end

	def edit
			
	end

	def update
		 @reply.update(replies_params)
    
	     if @reply.save
	        redirect_to ticket_path(@ticket)
	     else
	        render "edit" 
	     end
	end

	private

		def replies_params
			params.require(:reply).permit(:content)	
		end
		
		def find_ticket
			@ticket = Ticket.find(params[:ticket_id])
		end
		def find_reply
			@reply = Reply.find(params[:id])
		end
	
end
