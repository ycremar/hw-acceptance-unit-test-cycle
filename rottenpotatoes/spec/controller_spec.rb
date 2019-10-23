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
      describe "create" do
        let(:params) {{:title => "Alien"}}
        let(:movie) {double('movie', params)}
      
        it 'calls the create method to create a new movie' do
          expect(Movie).to receive(:create!).with(params).and_return(movie)
          post :create, {movie: params}  
        end
      end
      
      describe "destroy" do
        let(:movie) {double('movie',:title => 'Shrek')}
        let(:id) {'200'}
        
        it 'calls the find method to retrieve a movie' do
          expect(Movie).to receive(:find).with(id).and_return(movie)
          allow(movie).to receive(:destroy)
          delete :destroy, {:id => id}
        end
      end
    end
  end
  