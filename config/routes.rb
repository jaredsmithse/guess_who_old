Rails.application.routes.draw do
  devise_for :employees, controllers: { 
    omniauth_callbacks: "devise/omniauth_callbacks",
  }
  root to: "home#index"
  resources :employees, only: [:edit, :update] do 
    resources :guesses, only: [:new, :create, :index]
  end
end
