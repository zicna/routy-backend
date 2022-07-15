json.data do
    json.user do
        json.call(
            @user,
            :id,
            :email
            
        )
        json.call(
            @route,
            :name
        )
    end 
end