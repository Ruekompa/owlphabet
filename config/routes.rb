Rails.application.routes.draw do
  root to: "pages#home"

  get 'manager' => 'managers#home'

  devise_for :artists, controllers: { sessions: "artists/sessions", registrations: "artists/registrations" }

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
