TodoApplication.routes.draw do
  get "/todo", to: "custom#index"
  get "/todo/:id", to: "custom#show"
  get "/todo/new", to: "custom#new"
  get "/todo/:id/edit", to: "custom#edit"
  post "/todo/:id", to: "custom#create"
  put "/todo/:id", to: "custom#update"
  patch "/todo/:id", to: "custom#update"
  delete "/todo/:id", to: "custom#destroy"
end
