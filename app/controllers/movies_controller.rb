class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    @genres = Genres.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    begin
      @movie.save!
        redirect_to root_url
    rescue => exception
      flash[:notice] = exception
    ensure
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    begin
      @movie.update!(movie_params)
    rescue => exception
      flash[:notice] = exception
    ensure
    end
  end

  def destroy
    @movie = Movie.find(params[:id])

    begin
      @movie.destroy!
    rescue => exception
      flash[:notice] = exception
    ensure
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :date, :score, :director, :description, :trailer, :genre_id)
  end
end
