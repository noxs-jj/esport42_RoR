Rails.application.routes.draw do
	get 'contact_us/new' => 'contact_us#new', as: 'contact_us'
  post 'contact_us/create' => 'contact_us#create', as: 'contact_us_create'

  get 'participant/index/:event_id' 	=> 'participant#index', as: 'participants_event_index'
	get 'participant/show/:id'					=> 'participant#show', as: 'participant_show'
	get 'participant/:event_id/create'	=> 'participant#create', as: 'participant_event_create'
  get 'participant/:id/delete'				=> 'participant#delete', as: 'participant_delete'

  get 'event/index'
  get 'event/show/:id' => 'event#show', as: 'event_show'

  get 'welcome' => 'welcome#index'

  namespace :backoffice do
    get 'event/index'
    get 'event/show'
    get 'event/new'
    get 'event/create'
    get 'event/edit'
    get 'event/update'
    get 'event/delete'

    get 'dashboard/index' => "dashboard#index"

    root :to => "dashboard#index"
  end

  root :to => 'welcome#index'

  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  devise_for :users
end
