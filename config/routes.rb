Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  ActiveAdmin.routes(self)

  scope '(:locale)', locale: /fr|en/ do
    root to: 'pages#home'
    resources :leads, only: [:new, :create, :show]
    # resources :create_lead_steps
    resource :user, only: [:edit] do
      collection do
        put 'update_password'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
