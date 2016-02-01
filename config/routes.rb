Rails.application.routes.draw do

  root 'welcome#index'

  # get 'users/:id' => 'users#show'
  get 'upload' => 'uploads#new'
  post 'uploads/create' => 'uploads#create'

  devise_for :users, controllers: { registrations: "users/registrations" }

  get "/users" => 'users#index'

  resources :productions do
    resources :channels
  end

  resources :admins

  #below realistically out to single out indexes if we
  #don't use them for anything else
  resources :unit_libraries
  resources :color_libraries

end
