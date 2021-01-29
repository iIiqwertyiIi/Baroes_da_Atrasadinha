# frozen_string_literal: true

class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    begin
      @review.save!
    rescue StandardError => e
      flash[:notice] = e
    ensure
      redirect_to movie_path(params[:review]['movie_id'])
    end
  end

  def edit
    @review = Review.find(params[:movie_id])
  end

  def update
    @review = Review.find(params[:movie_id])

    begin
      @review.update!(review_params)
    rescue StandardError => e
      flash[:notice] = e
    ensure
      redirect_to movie_path(params[:review]['movie_id'])
    end
  end

  def destroy
    @review = Review.find(params[:id])

    begin
      @review.destroy!
    rescue StandardError => e
      flash[:notice] = e
    ensure
      redirect_back fallback_location: root_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :movie_id, :score, :review)
  end
end
