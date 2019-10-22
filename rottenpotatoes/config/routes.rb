Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  get '/movies/:id/movies_by_director' => 'movies#movies_by_director', :as => :movies_by_director
end
