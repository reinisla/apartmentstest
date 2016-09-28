class FlatsController < ApplicationController
  before_action :set_flat, only: [ :show, :edit, :update, :destroy]
  before_action :set_property, only: [:show, :edit, :update, :destroy]
 
  def new
    @property = Property.find(params[:property_id])
    @flat = Flat.new
  end

  def create 

    authorize! :create, Flat
    @property = Property.find(params[:property_id])
    @flat = @property.flats.build(flat_params)
    @flat.user = current_user
    
    if @flat.save
         redirect_to property_path(@property), notice: "Flat nr: #{@flat.flat_nr} has been added."
      else
        render "new" 
      end

    
  end

  def destroy
    @flat = Flat.find(params[:id]).destroy
    redirect_to property_path(@flat.property_id), notice: "Flat nr: #{@flat.flat_nr} has been deleted."
  end

  def show
    authorize! :read, Flat
    
   
  end
  
  def edit
      authorize! :update, @flat
  end

  def update
    @flat.update(flat_params)
    
     if @flat.save
         redirect_to property_path(@flat.property_id), notice: "Flat nr: #{@flat.flat_nr} has been changed."
      else
        
        render "edit" 
      end
  end

  private

   
    def flat_params
      params.require(:flat).permit(:name, :surname, :content, :housenr, :flat_nr, :caretaker, :join_date, :status, :phone, :email, :morepersons, :relatives)
    end

    def set_flat
       @flat = Flat.find(params[:id])
    end

    def set_property
      @property = Property.find(params[:property_id])
    end

    def set_ownerhistory
      @ownerhistories = Ownerhistory.find(params[:ownerhistory_id])
    end
     

  end