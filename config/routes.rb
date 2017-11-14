Rails.application.routes.draw do

  resources 'clients', only: [:new, :create]

  resources 'events', only: [:index]

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
