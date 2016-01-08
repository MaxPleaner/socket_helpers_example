class NotepadController < ApplicationController
  def update
    notepad = Notepad.find_by(params[:id])
    if notepad
      notepad.update(content: params[:content])
      websocket_response(notepad, "update")
    else
      notepad = Notepad.create(
        content: params[:content],
        name: params[:name],
        id: params[:id]
      )
      websocket_response(notepad, "create")
      websocket_response(notepad, "update")
    end
    render text: ""
  end
  def destroy
    notepad = Notepad.find_by(params[:id]) || Notepad.new
    notepad.destroy
    websocket_response(notepad, "destroy")
    render text: ""
  end
end
