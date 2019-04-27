Rails.application.routes.draw do
  root 'home#index'

  namespace :effects do
    resources :progress do
      get 'configure', on: :collection
    end
  end
end
