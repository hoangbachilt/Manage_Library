get "signup" => "devise/users#new"
    post "signup" => "devise/users#create"
  end
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end