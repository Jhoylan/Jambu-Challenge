Rails.application.routes.draw do
  root "requests#new"

  post "/research" => "requests#research"
  post "/showFavorites" => "requests#showFavorites"
  
  get "/searchFavorites" => "requests#searchFavorites"
  get "/people/:id" => "requests#show"
  get "/planets/:id" => "requests#show"
  get "/starships/:id" => "requests#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
