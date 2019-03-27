Rails.application.routes.draw do
  root "orders#index"

  resources :orders, only: [:index, :edit, :new, :create, :update] do 

  end

end
