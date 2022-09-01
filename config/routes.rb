Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
  get '/basket', to:  "order_items#index"

  resources :products do
    resources :order_items, only: %i[create update destroy]
  end

end
