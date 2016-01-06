Rails.application.routes.draw do
  
  # auth
  get "/todos", to: "authentication#root"
  post "authenticate", to: "authentication#authenticate"
  post "logout", to: "authentication#logout"
  
  # todos api
  get "todos", to: "html_pages#todos"
  post "todos", to: "todos#create"
  delete "todos", to: "todos#destroy"

  # html root
  get "/html_root", to: "html_pages#root"

  # root
  get "/", to: "authentication#root"

end
