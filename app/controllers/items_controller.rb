class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    clean_params = params.require(:item).permit(:title, :description, :owner, :type)
    @item = Item.new(clean_params)
    if @item.save
        redirect_to @item, notice: 'Item was successfully created.'
    else
      render action: 'new'
    end
  end
end
