class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant

    if @review.save
      flash[:notice] = "Review added successfully!"
      redirect_to @review.restaurant
    else
      flash[:error] = @review.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end

end
