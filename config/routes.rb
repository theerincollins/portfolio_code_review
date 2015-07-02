Rails.application.routes.draw do
  root 'skills#index'

  resources :skills do
    resources :projects
  end
end
