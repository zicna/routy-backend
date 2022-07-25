class V1::SessionsController < ApplicationController
    before_action :authenticate_user!, :except => [:create] 
    def create
        @user = User.where(email: user_params[:email]).first
        
        #! user&. same as user && user.valid_password?
        if @user&.valid_password?(user_params[:password])
            jwt = WebToken.encode(@user)
            render :create, locals: {token: jwt}, status: :created
        else
            render json: { error: 'invalid credentials' }, status: :unauthorized
        end
           
    end

    def destroy
        user = current_user
        if user_signed_in?
            sign_out user
            render json: {message: 'successful log out'}, status: :ok
        else
            render json: { error: 'invalid credentials' }, status: :unauthorized
        end
    end

    private 
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end 