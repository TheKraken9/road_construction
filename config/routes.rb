Rails.application.routes.draw do
  root "provider#index"
  get "/articles", to: "articles#index"
  get "/rn", to: "rn#index"
  get "/home", to: "provider#index"
  get "/roads", to: "roads#index"
  get "/specified", to: "specified#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
