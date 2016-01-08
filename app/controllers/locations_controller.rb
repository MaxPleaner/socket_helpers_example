class LocationsController < ApplicationController
  def create
    location = Location.create(
      name: params[:name],
      description: params[:description]
    )
    websocket_response(location, "create")
    render text: ""
  end
  def destroy
    location = Location.find_by(id: params[:id]) \
               || Location.new
    location.destroy
    LocationCategorization.where(
      location_id: location.id
    ).includes(:location).each do |category|
      if !(category.location) || Location.exists?(
        name: category.location.name
      )
        websocket_response(category, "destroy")
        category.destroy
      end
    end
    websocket_response(location, "destroy")
    render text: ""
  end
  def categorize
    location = Location.find_by(id: params[:id]) || Location.new  
    new_category = LocationCategorization.new(
      location_id: location.id,
      category: params[:category]
    )
    unless LocationCategorization.exists?(
      category: params[:category]
    )
      new_category.save
      websocket_response(new_category, "create")
    end
    render text: ""
  end
end
