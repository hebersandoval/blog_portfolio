Rails.application.routes.draw do
  root 'pages#home'
  get 'signin', to: 'pages#signin'
  get 'services', to: 'pages#services'
  get 'about', to: 'pages#about'

  get 'portfolio', to: 'projects#index'
  get 'blog', to: 'posts#index'

  devise_for :users
  resources :users
  resources :posts
  resources :projects
  resources :categories

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
