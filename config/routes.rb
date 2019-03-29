Rails.application.routes.draw do
  root "orders#index"

  resources :orders, only: [:index, :edit, :new, :create, :update, :destroy] do 
  end

  resources :products, only: [:create, :destroy] do 
  end

end
