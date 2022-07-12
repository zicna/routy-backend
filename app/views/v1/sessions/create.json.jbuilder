json.data do 
    json.user do 
        json.call(
            @user,
            :id,
            :email,
            :username,
        )
    end
    json.jwt jwt
end