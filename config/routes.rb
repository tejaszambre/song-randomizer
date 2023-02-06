Rails.application.routes.draw do
  resources :moods do
    member do
      post 'add_song', to: 'moods#add_song'
      delete 'remove_song', to: 'moods#remove_song'
    end
  end
  resources :songs do
    member do
      delete 'remove_mood', to: 'songs#remove_mood'
    end
  end
  resources :users do
    member do
      post 'add_to_playlist', to: 'users#add_to_playlist'
      delete 'remove_from_playlist', to: 'users#remove_from_playlist'
      post 'add_mood', to: 'users#add_mood'
      delete 'remove_mood', to: 'users#remove_mood'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
