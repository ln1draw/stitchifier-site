Rails.application.routes.draw do
  resources :user_images
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get   "welcome/index"

  root  "welcome#index"
  match "*path", to: redirect("/"), via: :all
end
