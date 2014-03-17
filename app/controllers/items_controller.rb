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

  def search
    @categories = Category.all.map {|c| [c.title, c.id]}
  end

  def do_search
    puts "**** #{params}"
    redirect_to items_path
  end
end
