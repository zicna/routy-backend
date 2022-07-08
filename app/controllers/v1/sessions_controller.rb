class V1::SessionsController < ApplicationController
    def create
        user = User.where(email: params[:user][:email]).first
        #! user&. same as user && user.valid_password?
        if user&.valid_password?(params[:user][:password])
            render json: user.as_json(only: [:id, :email, :username]), status: :created
        else
            head(:unauthorized)
        end
    end

    def destroy
    end
end 