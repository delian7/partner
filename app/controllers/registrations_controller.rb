class RegistrationsController < Devise::RegistrationsController
 
  private
 
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :imgsrc, :password_confirmation)
  end
 
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :imgsrc, :current_password)
  end
end