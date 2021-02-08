Rails.application.routes.draw do
  resources :fake_professionals
  root to: "home#index"
  devise_for :users
  resources :sizes
  resources :animals
  resources :items
  resources :categories
  
  get "/get_professionals", to: "fake_professionals#json_url"
  get "/get_categories", to: "categories#json_url"
  get "/get_animals", to: "animals#json_url"
  get "/get_items", to: "items#json_url"
  get "/get_sizes", to: "sizes#json_url"
  get "/get_users", to: "user_own#json_url"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
