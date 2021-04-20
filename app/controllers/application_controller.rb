class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :admin_user
   #@current_user=User.find_by(id: session[:user_id])
  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys:[
     :name,
     :telephone_number,
     :address,
     :profile_image_id
     ])
  end

  def admin_user
   if @current_user==nil
    flash[:notice]="ログインが必要です"
    redirect_to("/login")
   end
  end
end
