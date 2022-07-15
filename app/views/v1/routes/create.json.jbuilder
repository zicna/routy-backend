
json.data do
    json.user do
        json.id @user.id
        json.email @user.email
        json.route_name @route.name
    end 
end