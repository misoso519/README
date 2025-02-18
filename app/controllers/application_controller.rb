class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  allow_browser versions: :modern

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_picture])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_picture])
  end
end
