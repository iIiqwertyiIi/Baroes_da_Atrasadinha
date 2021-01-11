class MoviesController < ApplicationController
  def index
    @movie = movie.all
  end

  def show
    @movie = movie.find(params[:id])
  end

  def new
    @movie = movie.new
  end

  def create
    @movie = movie.new(movie_params)

    begin
      @movie.save!
    rescue => exception
      flash[:notice] = exception
    ensure
    end
  end

  def edit
    @movie = movie.find(params[:id])
  end

  def update
    @movie = movie.find(params[:id])

    begin
      @movie.update!(movie_params)
    rescue => exception
      flash[:notice] = exception
    ensure
    end
  end

  def destroy
    @movie = movie.find(params[:id])

    begin
      @movie.destroy!
    rescue => exception
      flash[:notice] = exception
    ensure
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :date, :score, :director, :description, :trailer)
  end
end
