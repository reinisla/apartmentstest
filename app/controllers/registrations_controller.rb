class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:name, :surname, :email, :location, :password, :password_confirmation, :role_id, :orderby, :avatar, :avatar_cache, :remove_avatar)
  end

  def account_update_params
    params.require(:user).permit(:name, :surname, :email, :location, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar)
  end
end