class DocumentsController < ApplicationController
   before_action :find_document, only: [:show, :edit, :update, :destroy]
   before_action :find_property, only: [:index,:create, :new, :show, :edit, :update, :destroy]
   def index
    @documents = Document.where property_id: @property

   end
   
   def new  		 
    @document = Document.new
   end
   
   def create
    
    @document = @property.documents.build(document_params)
      if @document.save
         redirect_to property_documents_path, notice: "The document #{@document.name} has been uploaded."
      else
         render "new"
      end
      
   end
   
   def destroy
    @document.destroy
      redirect_to property_documents_path, notice:  "The document #{@document.name} has been deleted."
   end
   
   private

    def document_params
      params.require(:document).permit(:name, :attachment)
   	end

   	def find_property
       @property = Property.find(params[:property_id])
    end
   	def find_document
   		@document = Document.find(params[:id])
   	end
end