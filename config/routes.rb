Rails.application.routes.draw do
  get "search/index"
  get "questions/new"
  get "questions/create"
  get "questions/show"
  get "questions/index"
  get "categories/show"
  get "users/show"
  get 'search', to: 'search#index', as: 'search'
  
  devise_for :users

  resources :tasks, only: [:index, :show]
  resources :questions do
    resources :answers, only: [:create]
  end
  resources :questions, only: [:new, :create, :show, :index]
  resources :categories, only: [:index, :show]
  resources :categories, only: [:index]

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root 'questions#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  Rails.application.routes.draw do
  get "search/index"
    resources :questions
  end
end
