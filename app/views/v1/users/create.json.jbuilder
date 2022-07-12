json.data do
    json.user do
        json.call(
            @user,
            :id,
            :email,
            :username,
            :confirmed_at
        )
    end
end 