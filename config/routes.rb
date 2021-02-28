Rails.application.routes.draw do
  root "requests#new"

  post "research" => "requests#research"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
