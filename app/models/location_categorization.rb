class LocationCategorization < ActiveRecord::Base
  belongs_to :location

  def attributes
    attrs = super.merge({
      'record_class' => "category",
      'locations' => LocationCategorization.where(category: category).includes(:location).map(&:location).map(&:try.(:name)).join(", ")
    })
    return attrs.reject do |k,v|
      ["created_at",
        "updated_at"
        ].include?(k)
    end
  end

  def published_class
    "category"
  end

end
