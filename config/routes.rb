Rails.application.routes.draw do
  root "requests#new"

  post "/research" => "requests#research"
  get "/research" => "requests#new"
  post "/showFavorites" => "requests#showFavorites"
  get "/showFavorites" => "requests#searchFavorites"
  
  get "/searchFavorites" => "requests#searchFavorites"
  get "/:id" => "requests#show"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
