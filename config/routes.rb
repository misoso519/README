Rails.application.routes.draw do
  get "questions/new"
  get "questions/create"
  get "questions/show"
  get "questions/index"
  get "categories/show"
  get "users/show"
  devise_for :users
  resources :users, only: [:show]
  resources :tasks, only: [:index, :show]
  resources :questions do
    resources :answers, only: [:create]
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root 'questions#index'
end
