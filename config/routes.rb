Rails.application.routes.draw do
  get 'users/profile'
  get 'help/index'
  get 'courses/index'
  get 'courses/set_course'
  

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
        end
     collection do
        end
    end

  resources :groups do
     member do
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