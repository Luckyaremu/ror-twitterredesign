class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_names last_name photo cover_image])
    devise_parameter_sanitizer.permit(:edit, keys: %i[first_names last_name photo cover_image])
  end
end
