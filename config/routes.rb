Rails.application.routes.draw do
  devise_for :users, controllers: {
                 sessions: "users/sessions"
                   }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "pages#index"
  post "/order-request", as: "order_request", to: "forms#order_request"


  match "*url", to: redirect("/"), via: [:get, :post, :path, :put, :update, :delete]
end