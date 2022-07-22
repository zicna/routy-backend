class V1::MarkersController < ApplicationController
    def create
        @user = current_user

        if @user
            @marker = Marker.create(user_id: @user.id, name: markers_params[:marker_name])

            render :create, status: :created
        else
            render json: { error: 'invalid_credentials' }, status: :unauthorized
        end

    end

    def destroy
        @marker = Marker.find_by(id: markers_params[:marker_id])

        @marker.destroy

        render :delete, status: :ok
    end

    private
    def markers_params
        params.require(:user).permit(:marker_id, :user_id, :marker_name, :category, :description, :color, :latitude, :longitude)
    end
end
