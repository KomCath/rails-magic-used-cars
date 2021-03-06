Rails.application.routes.draw do
  root 'static_pages#home'

  get    '/signup', to: 'users#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:index, :show, :create] do
    resources :vehicles, only: [:new, :create, :edit, :update]
  end
end
