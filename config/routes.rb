Rails.application.routes.draw do
  get 'participant_statu/index'
  get 'participant_statu/show'
  get 'participant_statu/create'
  get 'participant_statu/edit'
  get 'participant_statu/update'

  get 'participant_type/index'
  get 'participant_type/show'
  get 'participant_type/create'
  get 'participant_type/edit'
  get 'participant_type/update'
  get 'participant/index'
  get 'participant/create'
  get 'participant/show'
  get 'participant/delete'

  get 'event/index'
  get 'event/create'
  get 'event/edit'
  get 'event/show/:id' => 'event#show', as: 'event_show'
  get 'event/update'
  get 'event/delete'

  get 'welcome' => 'welcome#index'

  root :to => 'welcome#index'

  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  devise_for :users
end
