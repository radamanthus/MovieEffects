Rails.application.routes.draw do
  root 'home#index'

  namespace :effects do
    resources :processing do
      get 'configure', on: :collection
    end

    resources :access do
      get 'configure', on: :collection
    end
  end
end
