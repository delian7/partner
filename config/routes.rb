Rails.application.routes.draw do

  root :to => "visitors#index"
  devise_for :users


  resources :users do
    member do
        get :flop
        get :cancel
        get :clearall
        get :export
    end
    end

  resources :visitors do
    member do
        get :new
    end
    end

resources "contacts", only: [:new, :create]

get '/bug', to: 'contacts#bug'

devise_scope :user do
  get "sign_in", to: "devise/sessions#new"
  get "sign_up", to: "devise/registrations#new"
end


end
