Rails.application.routes.draw do
  resources :setlists
  resources :musics

  post '/search_chords', to: 'chords_searches#search'
end
