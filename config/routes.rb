Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "celebrities#index"
  get "/:celebrity", to: "celebrities#show"

  post "/create", to: "celebrities#create"
  post "/:celebrity/update", to: "celebrities#update"
  post "/:celebrity/delete", to: "celebrities#destroy"

end

