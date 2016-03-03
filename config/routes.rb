Rails.application.routes.draw do
  devise_for :artists, controllers: { registrations: 'artists/registrations' }
  as :artist do
  get 'artists/edit' => 'artists/registrations#edit'   
  put 'artists/:id' => 'artists/registrations#update'           
  end
 
  root to: "pages#home"

  resources :artists do
    resource :profile
    resources :albums do
      resources :tracks
    end
  end
end
