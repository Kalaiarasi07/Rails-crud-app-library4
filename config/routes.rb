Rails.application.routes.draw do
  root 'book#index'
  get 'show_subjects/:id', to: 'book#show_subjects'
  resources :book   
end
