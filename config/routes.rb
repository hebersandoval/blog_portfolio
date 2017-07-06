Rails.application.routes.draw do
  root 'pages#home'
  get 'blog', to: 'pages#blog'
  get 'post', to: 'pages#post'
  get 'portfolio', to: 'pages#portfolio'
  get 'project', to: 'pages#project'
  get 'signin', to: 'pages#signin'
  get 'about', to: 'pages#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
