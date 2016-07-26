Rails.application.routes.draw do
  resources :issues
  resources :issues
  resources :version_tests
  resources :versions
  resources :version_tests
  resources :versions
  resources :tests
  root to: "versions#index"

  get 'versiontests' , to: 'versions#versiontests', as: :versiontests
  get 'versionissues' , to: 'versions#versionissues', as: :versionissues
end
