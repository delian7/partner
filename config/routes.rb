Rails.application.routes.draw do
  resources :reports
  mount Upmin::Engine => '/kayslegion'

  get 'groups/profile'
  get 'users/profile'
  get 'roster', to: 'roster#index'
  get 'playground', to: 'visitors#playground'
  get 'eval_gen', to: 'users#eval_gen'
  get 'phone_gen', to: 'users#phone_gen'
  get 'avatar_gen', to: 'users#avatar_gen'
  get 'avail_gen', to: 'users#avail_gen'
  get 'desc_gen', to: 'users#desc_gen'
  get 'gen', to: 'users#gen'
  post 'courses/csv_import'


  devise_for :users, :controllers => {:registrations => "registrations"}
  root :to => "visitors#index"

  resources :users do
    member do
      get :registrations
      get :sessions


      post :set_current_course
      post :set_current_project

    end
    collection do
      get :desc_gen
      get :avail_gen
      get :avatar_gen
      get :phone_gen
      get :eval_gen
      get :gen

      get :export_ungrouped
      get :export_groups
    end
  end

  resources :groups do
    member do
      get :edit
      post :update
      get :remove
      get :leave
      get :request_join
      get :send_request
      get :disband
      get :show
      get :update
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
      get :show
      post :update
      get :remove
      get :set_user_current_course

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
      get :show
      get :increase_groupsize
      get :autogroup
      post :autogroup
      get :clear_partnerships
      post :set_current_project
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
      get :export_evals
      get :export_eval_summary
    end
  end

  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    get "sign_up", to: "devise/registrations#new"
    get "sign_out", to: "devise/sessions#destroy"
    get "edit", to: "devise/registrations#update"
  end

end
