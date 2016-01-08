class Chat < ActiveRecord::Base
  belongs_to(
    :sender,
    class_name: "User",
    primary_key: :id,
    foreign_key: :sender_id
  )
  belongs_to(
    :receiver,
    class_name: "User",
    primary_key: :id,
    foreign_key: :receiver_id
  )
  def attributes
    super.reject do |k,v|
      ["created_at",
        "updated_at"
        ].include?(k)
    end
  end
end
