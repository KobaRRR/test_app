Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users
  get 'test/home'
  get 'test/index'
  get '/' =>'test#login_form'
  get 'test/login_success' => 'test#login_success'
  post 'login' => 'test#login'
  get 'logout' => 'test#logout'
  get 'test/index' => 'test#index'

  # bcard_routes
  get 'bcard/index'
  get 'bcard/new'
  post 'bcard/create'
  get 'bcard/edit/:id' => 'bcard#edit'
  get 'bcard/destroy/:id' => 'bcard#destroy'
  patch '/bcard/update/:id' => 'bcard#update'

end
