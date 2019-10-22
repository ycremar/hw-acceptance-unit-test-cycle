require 'rails_helper'

describe MoviesController, type: 'controller' do
    let(:movies) { ['star wars', 'raiders'] }    

    context '#search_directors' do
      describe 'movie has a director' do
        it 'responds to the search_directors route' do
          @movie = Movie.create(:id => "100", title: "Before Sunrise", director: "Richard Linklater")
          get :movies_by_director, { id: 100 }
          end
        end 

      describe 'search similar movies' do
        it 'assigns similar movies to the template' do
          @movie_2 = Movie.create(:id => "205", title: "Before Sunrise", director: "Richard Linklater")
          @movie_3 = Movie.create(:id => "206", title: "Before Midnight", director: "Richard Linklater")
          get :movies_by_director, id:@movie_2[:id]
          expect(Movie.where(:director => @movie_2.director).size).to eq(2)
        end
      end
      
    end
  end
  