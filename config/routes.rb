Rails.application.routes.draw do
  root 'home#index'

  namespace :effects do
    resources :processing
    resources :access
  end
end
