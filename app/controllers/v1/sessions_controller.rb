class V1::SessionsController < ApplicationController
    def create
        @user = User.where(email: params[:user][:email]).first
        
        #! user&. same as user && user.valid_password?
        if @user&.valid_password?(params[:user][:password])
            jwt = WebToken.encode(@user)
            render :create, locals: {token: jwt}, status: :created
        else
            render json: { error: 'invalid_credentials' }, status: :unauthorized
        end
           
    end

    def destroy
        if current_user
            render json: {message: 'successful sign out'}, status: :ok
        else
            render json: { error: 'invalid_credentials' }, status: :unauthorized
        end
    end
end 