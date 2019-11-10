Rails.application.routes.draw do
  get 'pages/index'
  root "pages#index"
  devise_for :users
  resources :users, only: [:show]
  as :user do
    get "signin" => "devise/sessions#new"
    post "signin" => "devise/sessions#create"
    delete "signout" => "devise/sessions#destroy"
    get "signup" => "devise/users#new"
    post "signup" => "devise/users#create"
  end
end
