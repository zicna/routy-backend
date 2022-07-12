class ApplicationController < ActionController::API
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # byebug
    # devise_parameter_sanitizer.for(:user).push(:username)
    devise_parameter_sanitizer.permit(:user, keys: [:username])
  end
end
