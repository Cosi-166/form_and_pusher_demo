require 'pry-byebug'

class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
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

  def update
    respond_to do |format|
      if @item.update(items_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sample.errors, status: :unprocessable_entity }
      end
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

  # DELETE /samples/1
  # DELETE /samples/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_path }
      format.json { head :no_content }
    end
  end



  def items_params
    params.require(:item).permit(:description, :owner, :category_id)
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end




end
