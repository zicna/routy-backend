class V1::UsersController < ApplicationController
    before_action :authenticate_user!, :except => [:create]  

    def index
        @users = User.all

        render json: @users, status: :ok 
    end 

    def show
        @user = current_user
        jwt = WebToken.encode(@user)
        render :show, locals:{token: jwt}, status: :ok
    end

    def create 
        user = User.where(email: user_params[:email]).first_or_initialize
        if user.new_record?
            @user = User.new(user_params)
            if @user.save
                jwt = WebToken.encode(@user)
                render :create, locals: {token: jwt}, status: :created
            else
                render json: { error: 'invalid credentials' }, status: :unauthorized
            end

        else
            render json: { error: 'email already taken, please login' }, status: :unauthorized
        end

    end

    def destroy
        @user = current_user

        if @user.destroy
            head(:ok)
        else
            head(:unprocessable_entity)
        end
        # * head is rails way of just returning content in the header 
        # * there is no content in the body of response
    end

    private 

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
