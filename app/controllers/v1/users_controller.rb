class V1::UsersController < ApplicationController

    def index
        @users = User.all

        render json: @users, status: :ok 
    end 

    def create 
        @user = User.new(user_params)

        @user.save
        render :create
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
