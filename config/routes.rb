Rails.application.routes.draw do

  root 'welcome#index'
  get "/print" => 'productions#print'

  # get 'users/:id' => 'users#show'
  get 'upload' => 'uploads#new'
  post 'uploads/create' => 'uploads#create'
  get 'uploads/download' => 'uploads#download'

  devise_for :users, controllers: { registrations: "users/registrations" }

  get "/users" => 'users#index'

  resources :productions do
    resources :channels
  end

  get "/productions/:production_id/print" => 'productions#print'
  resources :admins

  get "/libraries" => 'libraries#index'
  get "/libraries/:id" => 'libraries#show'

end
