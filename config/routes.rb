Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products, except: [:index] do
    resources :histories, only:[:index,:new,:create]
  end

end
