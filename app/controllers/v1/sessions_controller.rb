class V1::SessionsController < ApplicationController
    def create
        @user = User.where(email: params[:user][:email]).first
        
        #! user&. same as user && user.valid_password?
        if @user&.valid_password?(params[:user][:password])
            jwt = JWT.encode ({user_id: @user.id, exp: (Time.now + 2.weeks).to_i}), Rails.application.secrets.secret_key_base, 'HS256'
            render :create, locals: {token: jwt}, status: :created
        else
            render json: { error: 'invalid_credentials' }, status: :unauthorized
        end
           
    end

    def destroy
    end
end 