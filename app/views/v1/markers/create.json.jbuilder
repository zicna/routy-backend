
json.data do
    json.user do
        json.id @user.id
        json.email @user.email
        json.marker do
            json.id @marker.id
            json.name @marker.name
            json.description @marker.description
            json.category @marker.category
            json.color @marker.color
            json.latitude @marker.latitude
            json.longitude @marker.longitude
        end
    end 
end