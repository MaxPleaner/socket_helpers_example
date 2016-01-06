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

  # users
  get "/users", to: "html_pages#show_user"

  # chats
  post "create_chat", to: "chats#create"
  # notepad
  get "/notepad", to: "html_pages#notepad"
  post "update_notepad", to: "notepad#update"

  # root
  get "/", to: "authentication#root"

end
