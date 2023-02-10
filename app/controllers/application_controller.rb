class ApplicationController < ActionController::Base
 before_action :authenticate_user!
  rescue_from CanCan::AccessDenied do | exception |
    redirect_to root_url, alert: exception.message
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
 

  private

  def after_sign_out_path_for(*)
    new_user_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[email name password password_confirmation bio avatar])
  end
end
