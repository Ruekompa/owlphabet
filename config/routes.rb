Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :artists, controllers: { registrations: 'artists/registrations' }
  as :artist do
  get 'artists/edit' => 'artists/registrations#edit'   
  put 'artists/:id' => 'artists/registrations#update'
  get 'artists/profile' => 'profiles#edit'           
  end

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
