Rails.application.routes.draw do
  devise_for :accounts, controllers: {
    registrations: "accounts/registrations",
    sessions: "accounts/sessions"
  }

  resources :transactions
  resources :banks
  resources :incomes
  resources :accounts

  get "dashboard" => "pages#dashboard"

  root to: redirect("http://www.billities.io")
end
