Rails.application.routes.draw do
  resources :talks
  resources :documentations
  resources :documentations
  resources :category_systems
  resources :istories
  resources :rastreamentos
  resources :people
  resources :statuses
  resources :tecnologies
  resources :sprints
  resources :categories
  resources :sistems
  resources :issues
  resources :version_tests
  resources :versions
  resources :tests
  root to: "versions#index"

  get 'versiontests' , to: 'versions#versiontests', as: :versiontests
  get 'download' , to: 'versions#download', as: :download
  get 'versionissues' , to: 'versions#versionissues', as: :versionissues
  get 'check' , to: 'version_tests#check', as: :check
  get 'history', to: "versions#history", as: :history
  get 'linked_issues', to: "versions#linked_issues", as: :linked_issues
  get 'set_all_tests', to: "version_tests#set_all_tests", as: :set_all_tests
  get 'progresso', to: "versions#progresso", as: :progresso

  resources :tests do
    post :update_row_order, on: :collection
  end
end
