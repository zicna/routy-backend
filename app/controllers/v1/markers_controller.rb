class V1::MarkersController < ApplicationController
    def create
        # byebug
        @user = current_user
        
        @marker = Marker.new(markers_params)
        @marker.user_id = @user.id
        
        if @marker.save
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
        params.require(:marker).permit(:name, :category, :description, :color, :latitude, :longitude)
    end
end
