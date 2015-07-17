Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :skills do
    resources :projects
  end

  resources :posts do
    resources :comments
  end

  resources :references

end
