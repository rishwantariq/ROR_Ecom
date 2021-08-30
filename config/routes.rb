Rails.application.routes.draw do
  resources :categories do
    resources :products
  end

  resources :products do
    resources :comments
  end


  devise_for :users
  resources :users do
    resources:categories
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
