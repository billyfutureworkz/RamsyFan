Rails.application.routes.draw do
  resources :dishes , only: [:index, :show]
  devise_for :users, controllers: { registrations: "registrations" }
  root :to => "dishes#index"
 
end
