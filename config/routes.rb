Rails.application.routes.draw do
  resources :reports
  mount Upmin::Engine => '/kayslegion'

  get 'groups/profile'
  get 'users/profile'
  get 'roster', to: 'roster#index'
  get 'playground', to: 'visitors#playground'
  post 'courses/csv_import'


  devise_for :users, :controllers => {:registrations => "registrations"}
  root :to => "visitors#index"

  resources :evaluations do
    member do
    end
    collection do
    end
  end

  resources :users do
    member do
      get :send_request
      get :undo_request

      get :registrations
      get :sessions


      post :set_current_course
      post :set_current_project

    end
    collection do
      get :export_organized
      get :export_horizontal
    end
  end

  resources :groups do
    member do
      get :edit
      post :update
      get :remove
      get :leave
      get :request_join
      get :disband

      get :confirm
      post :update_relation
      post :new_relation
    end
    collection do
    end
  end

  resources :courses do
    member do
      get :edit
      post :update
      get :remove
    end
    collection do
      get :csv_import
    end
  end

  resources :projects do
    member do
      get :edit
      post :update
      get :remove
      get :reduce_groupsize
      get :increase_groupsize
      get :autogroup
      post :autogroup
      get :clear_partnerships
    end
    collection do
    end
  end

  resources :grouprelations do
    member do
      get :edit
      post :update
      get :remove
    end
    collection do
    end
  end
  resources :evaluations do
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
