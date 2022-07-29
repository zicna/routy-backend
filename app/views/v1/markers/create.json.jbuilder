
json.data do
    json.user do
        json.id @user.id
        json.email @user.email
        json.marker do
            json.id @marker.id
            json.name @marker.name
            json.description @marker.description
            json.category @marker.category
            json.latitude @marker.latitude
            json.longitude @marker.longitude
        end
    end 
    json.message "new marker has been created"
end