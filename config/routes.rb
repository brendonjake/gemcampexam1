Rails.application.routes.draw do
  devise_for :users

  root 'post#index'
  resources :posts do
    resources :comments, except: :show
  end
  resources :categories, except: :show
  namespace :user do
    resources :posts
    resources :comments
  end
end
