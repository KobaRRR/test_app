Rails.application.routes.draw do
  resources :users
  get 'test/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "test/index" => "test#index"
end
