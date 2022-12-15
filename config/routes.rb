Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  post 'users/create'
  get 'users/edit/:user_id' => 'users#edit'
  patch 'users/update/:upd_user_id' => 'users#update'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

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
  patch 'bcard/update/:id' => 'bcard#update'
  get 'bcard/index/:company_name' => 'bcard#index_group'

end
