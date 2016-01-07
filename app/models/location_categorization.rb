class LocationCategorization < ActiveRecord::Base
  belongs_to :location
  def attributes
    super.merge({
      'record_class' => "category",
      'locations' => LocationCategorization.where(category: category).includes(:location).map(&:location).map(&:name).join(", ")
    })
  end
end
