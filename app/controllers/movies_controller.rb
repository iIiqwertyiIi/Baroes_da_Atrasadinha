class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def show
    @watchdoog = Watchlist.new
    @movie = Movie.find(params[:id])
    @users = User.all
    @isso = @movie.reviews.where(user_id: current_user.id)
  end

  def new
    @movie = Movie.new
    @genres = Genre.all
  end


  def create
    @movie = Movie.new(movie_params)
    @genres = params[:movie]['genre_ids']
    @old_genres = GenreMovie.where(movie_id: params[:id])
    begin
      @movie.save!
      @old_genres.each do |genre|
        genre.destroy
      end
      @genres.each do |genre|
        GenreMovie.create(genre_id: genre, movie_id: params[:id])
      end
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to root_url
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    @genres = Genre.all
  end

  def update
    @movie = Movie.find(params[:id])
    @genres = params[:movie]['genre_ids']
    @old_genres = GenreMovie.where(movie_id: params[:id])
    begin
      @movie.update!(movie_params)
      @old_genres.each do |genre|
        genre.destroy
      end
      @genres.each do |genre|
        GenreMovie.create(genre_id: genre, movie_id: params[:id])
      end
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to root_url
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @old_genres = GenreMovie.where(movie_id: params[:id])
    begin
      @movie.destroy!
      @old_genres.each do |genre|
        genre.destroy
      end
    rescue => exception
      flash[:notice] = exception
    ensure
      redirect_to root_url
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :date, :score, :director, :description, :trailer, :genre_ids)
  end
end
