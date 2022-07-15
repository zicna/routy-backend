class V1::RoutesController < ApplicationController
    def create
        @user = current_user

        if @user
            @route = Route.create(user_id: @user.id, name: routes_params[:routeName])

            render :create, status: :created
        else
            render json: { error: 'invalid_credentials' }, status: :unauthorized
        end

    end

    private
    def routes_params
        params.require(:user).permit(:routeName)
    end

    # def pins_parmas
    #     params.require(:user).permit(:pins)
    # end
end
