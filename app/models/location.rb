class Location < ActiveRecord::Base
  has_many(
    :categories,
    class_name: "LocationCategorization",
    foreign_key: :location_id,
    primary_key: :id,
  )

  validates :name, :description, presence: true

  def attributes
    attrs = super.merge(
      'categories' => categories.map(&:attributes)
    )
    return attrs.reject do |k,v|
      ["created_at",
        "updated_at"
        ].include?(k)
    end
  end
  
end
