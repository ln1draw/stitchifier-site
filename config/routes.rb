Rails.application.routes.draw do
  resources :user_images
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "user_images/:id/stitchify", to: "user_images#stitchify", as: "stitchify"

  root  "user_images#index"
  match "*path", to: redirect("/"), via: :all
end
