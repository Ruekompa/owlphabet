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
       resources :tracks do
         resources :songs, only: [:create]
     end
    end
    collection do
       match 'search' => 'projects#search', via: [:get, :post], as: :search
      end
  end

end
