Rails.application.routes.draw do
  root :to => "visitors#index"
  devise_for :users
  resources :users

  resources :users do
    member do
        get :flop
    end
end
end
