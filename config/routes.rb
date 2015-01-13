Rails.application.routes.draw do

  namespace :api do

    resources :folders, only: [:index, :create, :update, :show, :destroy]

    get "files/:folder", to: 'files#show'
    get "files/:folder/:path", to: 'files#show', 
      constraints: { path: /([\w._-]\/?)+/ }

  end

  get "files/:folder/:path", to: 'files#show',
    constraints: { path: /([\w._-]\/?)+/ }
  resources :folder, only: [:new, :edit]

  root to: 'folders#index'

end

