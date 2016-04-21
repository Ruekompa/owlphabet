Rails.application.routes.draw do
  root to: "pages#home"

  resources "contacts", only: [:new, :create]

  get 'manager' => 'managers#home'

  get 'invite/request' => 'invite_requests#select'
  get 'invite/artist' => 'invite_requests#new'
  get 'invite/listener' => 'invite_requests#user_invite'


  get 'music' => 'music#index'
  get 'music/projects' => 'music#projects'
  get 'music/projects/:id' => 'music#show_project', as: 'project'
  get 'music/projects/:project_id/albums/:album_id' => 'music#show_album', as: 'projects_album'

  devise_for :artists, controllers: { sessions: "artists/sessions", registrations: "artists/registrations", invitations: "artists/invitations" }

  get 'artists/sign_in' => 'sessions#new'

  resources :projects do
     resources :albums do
       delete 'delete_media', to: "tracks#delete_media"
       resources :tracks do
        get 'songs/:id/:basename.:extension' => 'tracks#download'
        post :update_row_order, on: :collection
         resources :songs, only: [:create]
     end
    end
  end


 get '/songs/:id/:basename.:extension' => 'tracks#download'

end
