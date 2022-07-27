json.data do
    json.user do
        json.call(
            @user,
            :id,
            :email
        )
    end
    json.userMarkers @user.markers
    json.token token
    json.message "new account created"
end 