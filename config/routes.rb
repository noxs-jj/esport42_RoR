Rails.application.routes.draw do
  get 'welcome' => 'welcome#index'

  root :to => 'welcome#index'

  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  devise_for :users
end
