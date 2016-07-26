Rails.application.routes.draw do
  resources :issues
  resources :issues
  resources :version_tests
  resources :versions
  resources :tests
  resources :version_tests
  resources :versions
  resources :tests
  root to: "versions#index"
end
