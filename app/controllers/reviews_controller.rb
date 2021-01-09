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
    rescue => exception
      flash[:notice] = exception
    ensure
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    begin
      @review.update!(review_params)
    rescue => exception
      flash[:notice] = exception
    ensure
    end
  end

  def destroy
    @review = Review.find(params[:id])

    begin
      @review.destroy!
    rescue => exception
      flash[:notice] = exception
    ensure
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :movie_id, :score, :review)
  end
end
