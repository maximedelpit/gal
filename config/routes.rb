Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  ActiveAdmin.routes(self)

  scope '(:locale)', locale: /fr|en/ do
    root to: 'pages#start'
    resources :leads, only: [:new, :create, :show]
    resources :create_lead_steps
    resources :tutorials, only: [:index, :show]
    resource :user, only: [:edit] do
      collection do
        put 'update_password'
      end
    end
  end

  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
