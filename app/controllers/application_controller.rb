class ApplicationController < ActionController::API
    # before_filter :authenticate_user!
    # ! before integrating with devise
    # def current_user
    #     @current_user ||=  User.where(id: decode_token).first
    # end

    # private def get_token
    #     request.headers["Authorization"].split(" ").last
    # end 

    # private def decode_token
    #     JWT.decode(get_token, Rails.application.secrets.secret_key_base, 'HS256').first['user_id']
    # end
    
    
    # ! permit parameters and add non default for devise (when using devise controllers)
#     before_action :configure_permitted_parameters, if: :devise_controller?

#   protected

#   def configure_permitted_parameters
#     # devise_parameter_sanitizer.for(:user).push(:username)
#     devise_parameter_sanitizer.permit(:user, keys: [:username])
#   end

end
