json.data do 
    json.user do 
        json.call(
            @user,
            :id,
            :email
        )
    end
    json.userMarkers @markers
    json.token token
    json.message "successfully signed in"
end