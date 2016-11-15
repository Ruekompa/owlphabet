Rails.application.routes.draw do
  root to: "pages#home"

  resources "contacts", only: [:new, :create]

  get 'invite/request' => 'invite_requests#select'
  get 'invite/artist' => 'invite_requests#new'
  # get 'invite/listener' => 'invite_requests#user_invite'


  get 'music' => 'music#index'
  get 'music/projects' => 'music#projects'
  get 'music/projects/:id' => 'music#show_project', as: 'music_project'
  get 'music/projects/:project_id/albums/:album_id' => 'music#show_album', as: 'music_project_album'
  get 'music/albums' => 'music#albums_index', as: 'music_albums'

  devise_for :artists, controllers: { sessions: "artists/sessions", registrations: "artists/registrations", invitations: "artists/invitations" }
  get 'artists/sign_in' => 'sessions#new'

  get 'admin' => 'managers#home'
  scope '/admin' do
  get 'dashboard' => 'managers#home'
  resources :projects do
     resources :albums do
       delete 'delete_media', to: "tracks#delete_media"
       resources :tracks do
        get 'uploads/songs/:id/:basename.:extension' => 'tracks#download'
        post :update_row_order, on: :collection
         resources :songs, only: [:create]
     end
    end
  end
end

 get 'uploads/songs/:id/:basename.:extension' => 'tracks#download'

end
