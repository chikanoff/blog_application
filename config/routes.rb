Rails.application.routes.draw do
  devise_for :users
  root "articles#index"

  resources :articles do
    resources :comments
  end

  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  devise_for :users, as: "unique_prefix"
end
