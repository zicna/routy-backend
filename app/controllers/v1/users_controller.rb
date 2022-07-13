class V1::UsersController < ApplicationController

    def index
        @users = User.all

        render json: @users, status: :ok 
    end 

    def show
        current_user
        render :show, locals:{token: 'jwt'}, status: :created
    end

    def create 
        @user = User.new(user_params)

        if @user.save
            jwt = JWT.encode ({user_id: @user.id, exp: (Time.now + 2.weeks).to_i}), Rails.application.secrets.secret_key_base, 'HS256'

            render :create, locals: {token: jwt}, status: :created
        else
            head(:unauthorized)
        end
    end

    def destroy
        @user = User.where(id: params[:id]).first

        if @user.destroy
            head(:ok)
        else
            head(:unprocessable_entity)
        end
        # * head is rails way of jusr returning content in the header 
        # * there is no content in the body of response
    end

    private 

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
