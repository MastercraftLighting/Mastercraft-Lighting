 Rails.application.routes.draw do

  root 'welcome#index'
  get "/print" => 'productions#print'

  # get 'users/:id' => 'users#show'
  post 'uploads/create' => 'uploads#create'
  post 'uploads/download' => 'uploads#download'

  devise_for :users, controllers: { registrations: "users/registrations" }

  devise_scope :user do
    get "/user/sign_out" => "devise/sessions#destroy"
  end

  get "/users" => 'users#index'
  get "/users/:user_id" => 'users#show'

  resources :productions do
    resources :equipments
  end

  get "/productions/:production_id/print" => 'productions#print'

  resources :admins

  get "/libraries" => 'libraries#index'
  get "/libraries/:id" => 'libraries#show'

end
