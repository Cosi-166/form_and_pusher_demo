class CommentsController < ApplicationController
  def index
    @comments = Item.where(id: params["item_id"]).first.comments
  end

  def show
    @comment = Comment.where(id: params["id"], item_id: params["item_id"])
  end

  def new
    @item = Item.find(params[:item_id])
    @comment = @item.comments.new
  end

  def create
    binding.pry
    @item = Item.find(params.require(:item_id))
    clean_params = params.require(:comment).permit(:from, :message)
    @comment = @item.comments.new(clean_params)
    if @comment.save
        redirect_to @item, notice: 'Item was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
  end
end
