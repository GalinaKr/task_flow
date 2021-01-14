Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations' }

  root 'join#index'

  resources :projects do
    resources :tasks do
      put :done
    end
  end
end
