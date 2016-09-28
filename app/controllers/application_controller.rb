class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  
  rescue_from CanCan::AccessDenied do |exception|
  redirect_to properties_url, :alert => exception.message
  end

  helper_method :mailbox, :conversation


  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end
  

 
end
