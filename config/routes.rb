Rails.application.routes.draw do

  get 'roster/index'
  get 'users/profile'
  get 'help', to: 'help#index'
  get 'courses', to: 'courses#index'
  get 'roster', to: 'roster#index'
  get 'courses/set_course'
  post 'courses/csv_import'
  

devise_for :users, :controllers => {:registrations => "registrations"}
  root :to => "visitors#index"
  
  resources :users do
     member do
        get :cancel
        get :confirm
        get :registrations
        get :sessions
        get :clearpartnership
        get :add_to_group
        get :ungroup
        get :add_partnership
        post :set_current_course
        post :request
        end
     collection do
       get :clearall
       get :export
        end
    end

  resources :courses do
     member do
       get :edit
       post :update
       get :remove
        end
     collection do
     get :import 
     get :csv_import
        end
    end

  resources :projects do
     member do
       get :edit
       post :update
       get :remove
        end
     collection do
        end
    end

devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    get "sign_up", to: "devise/registrations#new"
    get "sign_out", to: "devise/sessions#destroy"
    get "edit", to: "devise/registrations#update"
  end
end