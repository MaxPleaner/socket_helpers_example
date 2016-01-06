class NotepadController < ApplicationController
  def update
    notepad = Notepad.find(params[:id])
    notepad.update(content: params[:content])
    websocket_response(notepad, "create")
    render text: ""
    return false
  end
end
