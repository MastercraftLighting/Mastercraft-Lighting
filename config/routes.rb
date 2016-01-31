Rails.application.routes.draw do

  root 'welcome#index'

  get 'users/:id' => 'users#show'
  get 'upload' => 'uploads#new'
  post 'uploads/create' => 'uploads#create'

  devise_for :users, controllers: { registrations: "users/registrations" }

  get "/users" => 'users#index'

  resources :channels
  resources :productions


end
