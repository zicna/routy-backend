json.data do
    json.marker do
        json.id @marker.id
    end 
    json.message "Marker '#{@marker.name}' has been deleted"
end