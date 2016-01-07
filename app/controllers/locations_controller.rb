class LocationsController < ApplicationController
  def create
    location = Location.create(
      name: params[:name],
      description: params[:descroption]
    )
    websocket_response(location, "create")
    return false
  end
  def destroy
    location = Location.find_by(id: params[:id]) \
               || Location.new
    location.destroy
    websocket_response(location, "destroy")
    return false
  end
  def categorize
    location = Location.find_by(id: params[:id]) || Location.new  
    LocationCategorization.create(
      location_id: location.id,
      category: params[:category]
    )
    websocket_response(location, "update")
  end
end
