Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources:articles
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles, only: [:show]
  resources :articles, only: [:show,:index]
  resources :articles, only: [:show,:index,:new,:create]
  get 'signup', to: 'users#new'
  resources :users, except: [:new] 
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
