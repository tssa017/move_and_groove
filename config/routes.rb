Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'activity_logs#index'

  get "up" => "rails/health#show", as: :rails_health_check

  get 'user_info', to: 'user_info#show'

  resources :activity_logs

  resources :activities do
    get 'get_activity_type', on: :member
  end

  # Custom routes for static pages
  get 'about', to: 'about#index'
  get 'media', to: 'media#index'
end
