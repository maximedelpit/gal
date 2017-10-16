Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :leads, only: [:new, :create, :show] do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
