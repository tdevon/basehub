Rails.application.routes.draw do
  root to:'home#index'

  # Devise custom routing
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'register', to: 'devise/registrations#new'
  end

  # Dashboard
  get 'dashboard', to: "dashboard#index"

  # Projects
  resources :projects


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
