json.data do
    json.user do
        json.call(
            @user,
            :id,
            :email,
            :username,
            :authentication_token,
            :confirmed_at
        )
    end
end 