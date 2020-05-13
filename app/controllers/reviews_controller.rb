class ReviewsController < ApplicationController


  # GET /restaurants/:restaurant_id/reviews/new
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  # POST /restaurants/:restaurant_id/reviews
  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    # @review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  # DELETE /reviews/:id
  def destroy
    @review = Review.find(params[:id])
    restaurant = @review.restaurant
    @review.destroy
    redirect_to restaurant_path(restaurant)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
