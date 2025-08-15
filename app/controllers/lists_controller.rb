class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def new
    @list = List.new
  end

  def create
    @lists = List.all
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: "List created!"
    else
      @lists = List.all
      @show_new_list_modal = true
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @review = Review.new
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

end
