Rails.application.routes.draw do
  
  #================================================
  #   GET   /
  #================================================
  root 'lists#index'
  
  #================================================
  #   GET    /lists           => lists#index
  #   POST   /lists           => lists#create
  #   GET    /lists/new       => lists#new
  #   GET    /lists/:id/edit  => lists#edit
  #   GET    /lists/:id       => lists#show
  #   PUT    /lists/:id       => lists#update
  #   DELETE /lists/:id       => lists#destroy
  #================================================
  resources :lists
  
end
