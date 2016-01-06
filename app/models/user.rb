class User < ActiveRecord::Base
  has_many(
    :sent_chats,
    class_name: "Chat",
    primary_key: :id,
    foreign_key: :sender_id
  )
  has_many(
    :received_chats,
    class_name: "Chat",
    primary_key: :id,
    foreign_key: :receiver_id
  )
end
