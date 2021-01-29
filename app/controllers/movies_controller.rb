class MoviesController < ApplicationController

  def sorted
    @movies = Movie.all
    @notinhas = []
    @movies.each do |movie|
      reviews = movie.reviews
      unless reviews.count == 0
        @notinhas << reviews.map(&:score).sum / reviews.count
      end
    end
    @nora_to_ordenada = Hash[(0...@notinhas.count).zip @notinhas]
    @nora_ordenada = @nora_to_ordenada.sort_by{ |index, nora| nora }.reverse
  end

  def index
    @movies = Movie.all
    @notinhas = []
    @movies.each do |movie|
      reviews = movie.reviews
      unless reviews.count == 0
        @notinhas << reviews.map(&:score).sum / reviews.count
      end
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @users = User.all
    @isso = @movie.reviews.where(user_id: current_user.id)
    unless @movie.reviews.count == 0
      @nothinha = @movie.reviews.map(&:score).sum / @movie.reviews.count
    end
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
      unless imagem.nil?
        image_change(@movie)
      end
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
      imagem = params[:movie][:photo]
      unless imagem.nil?
        image_change(@movie)
      end
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

  def image_change(movie)
    imagem = params[:movie][:photo]
    unless imagem.nil?
      if movie.photo.attached?
        movie.photo.purge
      end
      movie.photo.attach(imagem)
    end
  end
end
