Rails.application.routes.draw do
  root to: "pages#home"

  resources "contacts", only: [:new, :create]

  get 'manager' => 'managers#home'

  get 'invite/request' => 'invite_requests#select'
  get 'invite/artist' => 'invite_requests#new'
  get 'invite/listener' => 'invite_requests#user_invite'


  devise_for :artists, controllers: { sessions: "artists/sessions", registrations: "artists/registrations", invitations: "artists/invitations" }

  get 'artists/sign_in' => 'sessions#new'


  resources :projects


  resources :projects do
     resources :albums do
       delete 'delete_media', to: "tracks#delete_media"
       resources :tracks do
        get '/songs/:id/:basename.:extension' => 'tracks#download' 
         resources :songs, only: [:create]
     end
    end
  end

end
