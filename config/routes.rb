Rails.application.routes.draw do
  resources :issues
  resources :version_tests
  resources :versions
  resources :tests
  root to: "versions#index"

  get 'versiontests' , to: 'versions#versiontests', as: :versiontests
  get 'download' , to: 'versions#download', as: :download
  get 'versionissues' , to: 'versions#versionissues', as: :versionissues
  get 'check' , to: 'version_tests#check', as: :check

  resources :tests do
    post :update_row_order, on: :collection
  end
end
