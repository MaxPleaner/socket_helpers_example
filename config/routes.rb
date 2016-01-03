Rails.application.routes.draw do
  # auth
  get "/", to: "authentication#root"
  post "authenticate", to: "authentication#authenticate"
  post "logout", to: "authentication#logout"

  # todos
  get "/todos", to: "html_pages#todos"
  post "todos", to: "todos#create"
  delete "todos", to: "todos#destroy"
end
