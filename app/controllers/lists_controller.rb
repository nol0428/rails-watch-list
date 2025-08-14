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
      redirect_to list_path(@list), status: :see_other
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @list = List.find(params[:id])
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

end
