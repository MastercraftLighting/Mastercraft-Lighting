Rails.application.routes.draw do

  root 'welcome#index'
  get "/print" => 'productions#print'

  # get 'users/:id' => 'users#show'
  get 'upload' => 'uploads#new'
  post 'uploads/create' => 'uploads#create'
  post 'uploads/download' => 'uploads#download'

  devise_for :users, controllers: { registrations: "users/registrations" }

  get "/users" => 'users#index'
  get "/users/:user_id" => 'users#show'

  resources :productions do
    resources :equipments
  end

  resources :admins

  get "/libraries" => 'libraries#index'
  get "/libraries/:id" => 'libraries#show'

end
