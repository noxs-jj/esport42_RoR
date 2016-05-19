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
    get 'game/index'
    get 'game/show/:id'     => 'game#show', as: 'game_show'
    get 'game/edit/:id'     => 'game#edit', as: 'game_edit'
    post 'game/update/:id'  => 'game#update', as: 'game_update'

    get 'event/:event_id/participant/index'       => 'participant#index', as: 'event_participant_index'
    post 'event/:event_id/participant/:id/update' => 'participant#update', as: 'event_participant_update'
    get 'event/:event_id/participant/:id/delete'  => 'participant#delete', as: 'event_participant_delete'

    get 'event/index'
    get 'event/show/:id'    => 'event#show', as: 'event_show'
    get 'event/new'
    post 'event/create'     => 'event#create', as: 'event_create'
    get 'event/edit/:id'    => 'event#edit', as: 'event_edit'
    post 'event/update/:id' => 'event#update', as: 'event_update'
    get 'event/delete/:id'  => 'event#delete', as: 'event_delete'
    resources :event

    get 'user/index'
    get 'user/show/:id'     => 'user#show', as: 'user_show'
    get 'user/edit/:id'     => 'user#edit', as: 'user_edit'
    post 'user/update/:id'  => 'user#update', as: 'user_update'

    get 'dashboard/index' => "dashboard#index"

    root :to => "dashboard#index"
  end

  root :to => 'welcome#index'

  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  devise_for :users, controllers: {registrations: 'users/registrations'}
end
