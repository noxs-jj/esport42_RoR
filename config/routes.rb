Rails.application.routes.draw do
  get 'tournament/index'  => 'tournament#index', as: 'tournament_index'
  get 'tournament/show'   => 'tournament#show', as: 'tournament_show'

  get 'game/index'    => 'game#index', as: 'gane_index'
  get 'game/show/:id' => 'game#show', as: 'game_show'

	get 'contact_us/new'     => 'contact_us#new', as: 'contact_us'
  post 'contact_us/create' => 'contact_us#create', as: 'contact_us_create'

  get 'participant/index/:event_id' 	=> 'participant#index', as: 'participants_event_index'
	get 'participant/show/:id'					=> 'participant#show', as: 'participant_show'
	get 'participant/:event_id/create'	=> 'participant#create', as: 'participant_event_create'
  get 'participant/:id/delete'				=> 'participant#delete', as: 'participant_delete'

  get 'event/index'
  get 'event/show/:id' => 'event#show', as: 'event_show'

  get 'welcome' => 'welcome#index'

  namespace :backoffice do
    get 'bracket/:bracket_id/cell/index'    => 'cell#bracket_cells', as: 'bracket_cells_list'
    get 'cell/show/:id'                     => 'cell#show', as: 'cell_show'
    get 'cell/edit/:id'                     => 'cell#edit', as: 'cell_edit'
    post 'cell/update/:id'                  => 'cell#update', as: 'cell_update'
    get 'cell/populate_bracket/:bracket_id' => 'cell#populate_bracket', as: 'cell_populate_bracket'
    get 'cell/son_fillit/:bracket_id'       => 'cell#son_fillit', as: 'cell_son_fillit'

    get 'bracket/index'            => 'bracket#index', as: 'bracket_index'
    get 'bracket/show/:id'         => 'bracket#show', as: 'bracket_show'
    get 'bracket/new'              => 'bracket#new', as: 'bracket_new'
    post 'bracket/create'          => 'bracket#create', as: 'bracket_create'
    get 'bracket/:id/edit'         => 'bracket#edit', as: 'bracket_edit'
    post 'bracket/:id/update'      => 'bracket#update', as: 'bracket_update'

    get 'bracket/:id/edit_cell'    => 'bracket#edit_cell', as: 'bracket_edit_cell'
    post 'bracket/:id/update_cell' => 'bracket#update_cell', as: 'bracket_update_cell'

    get 'tournament/bracket/:id'  => 'tournament#bracket_show', as: 'tournament_bracket_show'
    get 'tournament/index'        => 'tournament#index', as: 'tournament_index'
    get 'tournament/show/:id'     => 'tournament#show', as: 'tournament_show'
    get 'tournament/new'          => 'tournament#new', as: 'tournament_new'
    post 'tournament/create'      => 'tournament#create', as: 'tournament_create'
    get 'tournament/:id/edit'     => 'tournament#edit', as: 'tournament_edit'
    post 'tournament/:id/update'  => 'tournament#update', as: 'tournament_update'

    get 'game/index'
    get 'game/index/new'      => 'game#new', as: 'game_new'
    post 'game/index/create'  => 'game#create', as: 'game_create'
    get 'game/show/:id'       => 'game#show', as: 'game_show'
    get 'game/edit/:id'       => 'game#edit', as: 'game_edit'
    post 'game/update/:id'    => 'game#update', as: 'game_update'

    get 'event/:event_id/tournament/:tournament_id/participants' => 'participant#event_tournament_participants', as: 'event_tournament_participants'
    post 'tournament/:tournament_id/participant/radio_add'       => 'participant#tournament_participants_radio_add', as: 'tournament_participants_radio_add'
    post 'tournament/:tournament_id/participant/radio_remove'    => 'participant#tournament_participants_radio_remove', as: 'tournament_participants_radio_remove'
    get 'event/:event_id/participant/index'                      => 'participant#index', as: 'event_participant_index'
    post 'event/:event_id/participant/:id/update'                => 'participant#update', as: 'event_participant_update'
    get 'event/:event_id/participant/:id/delete'                 => 'participant#delete', as: 'event_participant_delete'

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
