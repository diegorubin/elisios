Rails.application.routes.draw do

  namespace :api do

    resources :folders, only: [:index, :create, :update, :show, :destroy]

    get "files/:folder", to: 'files#show'
    get "files/:folder/:path", to: 'files#show', 
      constraints: { path: /([\w]\/?)+/ }

  end

  resources :folder, only: [:new, :edit]

  root to: 'folders#index'

end

