Rails.application.routes.draw do
  get 'users/profile'
  get 'help/index'
  get 'webauth/index'

devise_for :users, :controllers => {:registrations => "registrations"}
  root :to => "visitors#index"
  resources :users do
     member do
        get :flop
        get :cancel
        get :confirm
        get :registrations
        get :sessions
        get :clearpartnership
        end
     collection do
       get :clearall
       get :export
        end
    end





devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    get "sign_up", to: "devise/registrations#new"
    get "sign_out", to: "devise/sessions#destroy"
    get "edit", to: "devise/registrations#update"
  end
end