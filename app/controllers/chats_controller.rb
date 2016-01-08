class ChatsController < ApplicationController
  def create
    @chat = Chat.find_by(id: params[:chat_id])
    @chat.update(
      content: "#{@chat.content} #{@current_user.name}: #{params[:content]}\n"
    )
    websocket_response(@chat, "update")
    render text: ""
  end
end
