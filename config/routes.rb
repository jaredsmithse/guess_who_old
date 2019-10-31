Rails.application.routes.draw do
  devise_for :employees, controllers: { 
    omniauth_callbacks: 'employees/omniauth_callbacks'
  }
  root to: 'home#index'
end
