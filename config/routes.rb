Rails.application.routes.draw do
  get 'html_pages/root'

  get "/", to: "html_pages#root"
  post "todos", to: "todos#create"
  delete "todos", to: "todos#destroy"
end
