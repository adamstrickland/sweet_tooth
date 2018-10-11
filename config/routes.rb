Rails.application.routes.draw do
  root to: "us#index", constraints: ->(r){ r.domain(2) =~ /somedomain\.com/ }
  root to: "uk#index", constraints: ->(r){ r.domain(2) =~ /somedomain\.co\.uk/ }
  get '/us', to: "us#index"
  get '/uk', to: "uk#index"

  mount Expansion::Engine, at: "/api/l10n"
end
