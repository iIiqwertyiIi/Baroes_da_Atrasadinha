# frozen_string_literal: true

class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)

    begin
      @genre.save!
    rescue StandardError => e
      flash[:notice] = e
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    begin
      @genre.update!(genre_params)
    rescue StandardError => e
      flash[:notice] = e
    end
  end

  def destroy
    @genre = Genre.find(params[:id])

    begin
      @genre.destroy!
    rescue StandardError => e
      flash[:notice] = e
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
