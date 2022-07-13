json.data do
    json.user do
        json.call(
            @current_user,
            :email
        )
    end
    json.jwt token
end