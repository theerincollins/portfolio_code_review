Rails.application.routes.draw do
  devise_for :users
  root 'skills#index'

  resources :skills do
    resources :projects
  end

  resources :posts do
    resources :comments
  end


end
