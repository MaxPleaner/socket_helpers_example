class TodosController < ApplicationController
  include SocketHelpers::ControllerHelpers
  def create
    todo = Todo.create(content: params[:content])
    websocket_response(todo, "create")
    render text: ""
    return false
  end
  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    websocket_response(todo, "destroy")
    render text: ""
    return false
  end
end
