TodoApplication.routes.draw do
  get "/todos", to: "todolist#index"
  get "/todo/:id", to: "todolist#show"
  get "/todo/new", to: "todolist#new"
  get "/todo/:id/edit", to: "todolist#edit"
  post "/todos", to: "todolist#create"
  put "/todo/:id", to: "todolist#update"
  patch "/todo/:id", to: "todolist#update"
  delete "/todo/:id", to: "todolist#destroy"
end