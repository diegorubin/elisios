Rails.application.routes.draw do
  namespace :api do
    resources :folders, only: [:create, :update, :show]
    get "files/:folder", to: 'files#show'
    get "files/:folder/:path", to: 'files#show', 
      constraints: { path: /([\w]\/?)+/ }
  end

  resources :folder, only: [:new, :edit]

  root to: 'folders#index'
end

