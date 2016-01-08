class TodosController < ApplicationController
  def create
    todo = Todo.create(content: params[:content])
    websocket_response(todo, "create")
    render text: ""
  end
  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    websocket_response(todo, "destroy")
    render text: ""
  end
end
