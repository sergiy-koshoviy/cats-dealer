Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#show'

  resources :cats, only: %i[index new]
  resource :dashboard, only: :show
end
