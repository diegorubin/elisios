Rails.application.routes.draw do
  namespace :api do
    resources :files
  end

  root to: 'folders#index'
end

