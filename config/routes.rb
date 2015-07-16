Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :dishes , only: [:index, :show, :new, :create, :edit, :update] do 
    member do
      post 'published'
      post 'un_published'
    end

    collection do 
      get 'my_dishes'
    end     
  end

  devise_for :users, controllers: { registrations: "registrations" }
  root :to => "dishes#index"
 
end
