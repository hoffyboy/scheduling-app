Rails.application.routes.draw do

  resources 'clients', only: [:new, :create]
  patch '/clients', to: 'clients#create'

  resources 'events', only: [:new, :create]

  get 'welcome/index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
