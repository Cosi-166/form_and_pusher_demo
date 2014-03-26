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
    item_params = params.require(:item).permit(:title, :description, :owner, :type)
    @item = Item.new(item_params)
    if @item.save
        redirect_to @item, notice: 'Item was successfully created.'
    else
      render action: 'new'
    end
  end

  def search
    @categories = Category.all.map {|c| [c.title, c.id]}
    @categories = [["any", 0]] + @categories
    @items = nil
  end

  def do_search
    match_parm = params.fetch(:match_no_match)
    all_any_parm = params.fetch(:all_any)
    title_parm = params.fetch(:title)
    cat_id_parm = params.fetch(:category_id)
    @items = Item.do_item_search(
          searchtitle: title_parm,
          catid: cat_id_parm.to_i,
          all_any: all_any_parm,
          match_no: match_parm)

    respond_to do |format|
      format.js
    end

  end

end
