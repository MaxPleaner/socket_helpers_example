class Todo < ActiveRecord::Base

  def attributes
    super.reject do |k,v|
      ["created_at",
        "updated_at"
        ].include?(k)
    end
  end
end
