class Location < ActiveRecord::Base
  has_many(
    :categories,
    class_name: "LocationCategorization",
    foreign_key: :location_id,
    primary_key: :id,
    dependent: :destroy
  )

  validates :name, :description, presence: true

  def attributes
    attrs = super
    return attrs.merge(
      'categories' => categories
    )
  end
end
