class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.movies_by_director(movie)
    return nil if movie.director.blank?
    Movie.all.where(director: movie.director)
  end
end
