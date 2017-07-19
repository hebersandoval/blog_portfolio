Rails.application.routes.draw do
  root 'pages#home'
  get 'signin', to: 'pages#signin'
  get 'about', to: 'pages#about'

  resources :posts
  resources :projects
  resources :categories

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
