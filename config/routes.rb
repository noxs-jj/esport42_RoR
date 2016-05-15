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
    get 'event/show/:id'    => 'event#show', as: 'event_show'
    get 'event/new'
    post 'event/create'     => 'event#create', as: 'event_create'
    get 'event/edit/:id'    => 'event#edit', as: 'event_edit'
    post 'event/update/:id' => 'event#update', as: 'event_update'
    get 'event/delete'

    get 'user/index'
    get 'user/show/:id'     => 'user#show', as: 'user_show'
    get 'user/edit/:id'     => 'user#edit', as: 'user_edit'
    post 'user/update/:id'  => 'user#update', as: 'user_update'

    get 'dashboard/index' => "dashboard#index"

    root :to => "dashboard#index"
  end

  root :to => 'welcome#index'

  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  devise_for :users
end
