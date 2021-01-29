# frozen_string_literal: true

class MoviesController < ApplicationController
  def sorted
    @movies = Movie.all
    @notinhas = []
    @movies.each do |movie|
      reviews = movie.reviews
      @notinhas << reviews.map(&:score).sum / reviews.count unless reviews.count.zero?
    end
    @nora_to_ordenada = Hash[(0...@notinhas.count).zip @notinhas]
    @nora_ordenada = @nora_to_ordenada.sort_by { |_index, nora| nora }.reverse
  end

  def index
    @movies = Movie.all
    @notinhas = []
    @movies.each do |movie|
      reviews = movie.reviews
      @notinhas << reviews.map(&:score).sum / reviews.count unless reviews.count.zero?
      if params[:search]
        @pagy, @records = pagy(Movie.search(params[:search]), items: 5)
      else
        @pagy, @records = pagy(Movie.all, items: 5)
      end
    end
    @i = 0
  end

  def show
    @watchdoog = Watchlist.new
    @movie = Movie.find(params[:id])
    @users = User.all
    @isso = @movie.reviews.where(user_id: current_user.id)
    @nothinha = @movie.reviews.map(&:score).sum / @movie.reviews.count unless @movie.reviews.count.zero?
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
      imagem = params[:movie][:photo]
      image_change(@movie) unless imagem.nil?
      @old_genres.each(&:destroy)
      @genres.each do |genre|
        GenreMovie.create(genre_id: genre, movie_id: params[:id])
      end
    rescue StandardError => e
      flash[:notice] = e
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
      imagem = params[:movie][:photo]
      image_change(@movie) unless imagem.nil?
      @old_genres.each(&:destroy)
      @genres.each do |genre|
        GenreMovie.create(genre_id: genre, movie_id: params[:id])
      end
    rescue StandardError => e
      flash[:notice] = e
    ensure
      redirect_to root_url
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @old_genres = GenreMovie.where(movie_id: params[:id])
    begin
      @movie.destroy!
      @old_genres.each(&:destroy)
    rescue StandardError => e
      flash[:notice] = e
    ensure
      redirect_to root_url
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :date, :score, :director, :description, :trailer, :genre_ids)
  end

  def image_change(movie)
    imagem = params[:movie][:photo]
    unless imagem.nil?
      movie.photo.purge if movie.photo.attached?
      movie.photo.attach(imagem)
    end
  end
end
