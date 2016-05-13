Rails.application.routes.draw do
  get 'welcome' => 'welcome#index'

  root :to => 'welcome#index'
end
