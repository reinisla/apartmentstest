class TicketsController < ApplicationController
  before_action :find_ticket, only: [ :flop,:show, :edit, :update, :destroy]

  def index
    @user = current_user
    @orderby = "created_at desc"
  	@tickets = Ticket.all.order(@orderby) 
    #@replies = Reply.find(params[:ticket_id])
    @url = request.path_info
   
  end

  def complain
  	@tickets = Ticket.where selection: 'complain'
    @url = request.path_info
  end

  def maintenance
  	@tickets = Ticket.where selection: 'maintenance'
    @url = request.path_info
  end

  def other
  	@tickets = Ticket.where selection: 'other'
    @url = request.path_info
  end

  def edit
  end

  def new
  
    if @flat = Flat.find_by_id(params[:flat_id]) == nil
    
      
      @ticket = Ticket.new
   
    else
      @user = current_user
      @flat = Flat.find(params[:flat_id])
      @property = Property.find(params[:property_id])
      @ticket = Ticket.new
   
    end
  end

  def show	
    @flat = Flat.find_by(params[:flat_id]) 
   
  end

  def create
  	@user = current_user
    @ticket = @user.tickets.build(ticket_params)

      if @ticket.save
        redirect_to tickets_path, notice: 'Ticket was successfully submitted.' 
      else
        render "new"
      end
    
  end

  def update
     @ticket.update(ticket_params)
    
     if @ticket.save
        redirect_to ticket_path(@ticket)
     else
        render "edit" 
     end
  end
  def destroy
    @replies = Reply.where ticket_id: @ticket
    @replies.destroy_all
    @ticket.destroy
    redirect_to tickets_path
  end

  def flop 
    @ticket.status = !@ticket.status # flop the status
    @ticket.save
    redirect_to ticket_path(@ticket)
  end

  def order
    @user = current_user
    @user.orderby = "created_at asc" # flop the status
    @user.save
    redirect_to tickets_path(@ticket)
  end

   

  private
  def ticket_params
    params.require(:ticket).permit(:content, :surname, :name, :address, :flat_nr, :phone, :selection, :subject, :status)
  end
  def find_ticket
    @ticket = Ticket.find(params[:id])  
  end
end
