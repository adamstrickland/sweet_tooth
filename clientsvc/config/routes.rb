Rails.application.routes.draw do
  resources :clients, only: [:show] do
    resources :features, only: [:index]
  end
end
