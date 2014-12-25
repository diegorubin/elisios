Rails.application.routes.draw do
  namespace :api do
    resources :files
  end
end

