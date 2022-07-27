json.data do
    json.marker do
        json.id @marker.id
    end 
    json.message "#{@marker.name} has been deleted"
end