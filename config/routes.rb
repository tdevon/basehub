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

  # Tasks
  resources :projects do
    resources :tasks
  end

  # Endpoints for sorting functionality via task_sort js
  resources :tasks do
    collection do
      patch :sort
    end
  end
  # get 'projects/:id/tasks', to: 'tasks#index', as: "tasks_path"
  # get 'projects/:id/tasks/new', to: 'tasks#new', as: "new_task_path"
  # post 'projects/:id/tasks/new', to: 'tasks#create'
  # get 'projects/:id/tasks/:task_id', to: 'tasks#show', as: "task_path"
  # post 'projects/:id/tasks/:task_id', to: 'tasks#update'
  # get 'projects/:id/tasks/:task_id/edit', to: 'tasks#edit', as: "edit_task_path"
  # delete 'projects/:id/tasks/:task_id', to: 'tasks#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
