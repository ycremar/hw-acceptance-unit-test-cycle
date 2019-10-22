Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  match '/movies/:id/movies_by_director', to: 'movies#movies_by_director', as: 'movies_by_director', via: :get
end
