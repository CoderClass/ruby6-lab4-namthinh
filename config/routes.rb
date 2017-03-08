Rails.application.routes.draw do

  get 'messages/index'

  get 'messages/show'

  resources :rooms do
    resources :messages
  end

  resources :messages
  root 'rooms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
