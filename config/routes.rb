Rails.application.routes.draw do
  resources :issues
  resources :version_tests
  resources :versions
  resources :tests
  root to: "versions#index"

  get 'versiontests' , to: 'versions#versiontests', as: :versiontests
  get 'versionissues' , to: 'versions#versionissues', as: :versionissues

  resources :tests do
    post :update_row_order, on: :collection
  end
end
