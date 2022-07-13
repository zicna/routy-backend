class ApplicationController < ActionController::API
    def current_user
        # byebug
        jwt = request.headers["Authorization"].split(" ").last


        user_id = JWT.decode(jwt, Rails.application.secrets.secret_key_base, 'HS256').first['user_id']

        @current_user =  User.where(id: user_id)

    end
    
    # ! when using devise controllers
#     before_action :configure_permitted_parameters, if: :devise_controller?

#   protected

#   def configure_permitted_parameters
#     # byebug
#     # devise_parameter_sanitizer.for(:user).push(:username)
#     devise_parameter_sanitizer.permit(:user, keys: [:username])
#   end
end
