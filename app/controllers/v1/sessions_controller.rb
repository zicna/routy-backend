class V1::SessionsController < ApplicationController
    def create
        if !@current_user
            @user = User.where(email: params[:user][:email]).first
            
            #! user&. same as user && user.valid_password?
            if @user&.valid_password?(params[:user][:password])
                @current_user = @user
                jwt = JWT.encode ({user_id: @user.id, exp: (Time.now + 2.weeks).to_i}), Rails.application.secrets.secret_key_base, 'HS256'
                puts @current_user.email
                render :create, locals: {token: jwt}, status: :created
            else
                head(:unauthorized)
            end
        else
            byebug
            puts @current_user.email
        end
    end

    def destroy
    end
end 