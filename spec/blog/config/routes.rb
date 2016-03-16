BlogApplication.routes.draw do
  root "home#index"
  get "/my_pages/about", to: "my_pages#about"
  get "/my_pages/tell_me", to: "my_pages#tell_me"
  get "/posts", to: "posts#index"
  get "/posts/new", to: "posts#new"
  get "/posts/:id", to: "posts#show"
  get "/post/:id/edit", to: "posts#edit"
  post "/posts", to: "posts#create"
  put "/posts/:id", to: "posts#update"
  patch "/posts/:id", to: "posts#update"
  delete "/post/:id", to: "posts#delete"
end
