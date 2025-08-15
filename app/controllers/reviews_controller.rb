class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @list = List.find(params[:list_id])
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      @bookmark = Bookmark.new
      render "lists/show", status: :unprocessable_content
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
