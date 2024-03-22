Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'activity_logs#index'

  get "up" => "rails/health#show", as: :rails_health_check

  get 'user_info', to: 'user_info#show'

  resources :activity_logs do
  end

  resources :activities do
    get 'get_activity_type', on: :member
  end

  # Route to about page
  get 'about', to: 'about#index'

  # Route to media page
  get 'media', to: 'media#index'
end