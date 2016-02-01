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

  get "/libraries" => 'libraries#index'
  get "/libraries/:id" => 'libraries#show'

end
