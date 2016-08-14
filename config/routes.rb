Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as: "about"
  get "contact" => "top#contact", as: "contact"

  resources :members do
    resources :posts
  end
  get "search" => "posts#search", as: "search"
  resources :posts

  #session controllers
  resource :session, only: [:create, :destroy]
  get "login" => "sessions#login", as: "login"

  #accounts controllers
  resource :account, only: [:show, :edit, :update]

  #mailer
  get "inquiry" => "inquiry#index", as: "index"
  post "inquiry/confirm" => "inquiry#confirm"
  post "inquiry/thanks" => "inquiry#thanks"
end
