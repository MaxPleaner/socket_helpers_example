class TodosController < ApplicationController
  include SocketHelpers::ControllerHelpers
  def create
    todo = Todo.create(content: params[:content])
    websocket_response(todo, "create")
  end
  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    websocket_response(todo, "destroy")
  end
end
