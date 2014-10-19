Rails.application.routes.draw do
  get 'users/profile'
  get 'help/index'
  get 'courses/index'
  get 'courses/set_course'
  post "delete", to: "projects#destroy"
  

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
        end
     collection do
       get :clearall
       get :export
        end
    end

  resources :courses do
     member do
        put :set_course
        patch :set_course
        end
     collection do
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