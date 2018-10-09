Rails.application.routes.draw do
  get '/us', to: "us#index"
  get '/uk', to: "uk#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
