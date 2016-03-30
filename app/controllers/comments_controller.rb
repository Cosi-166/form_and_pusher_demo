require 'pusher'

Pusher.app_id = '69892'
Pusher.key = '5e157d0652d97d9fa6d4'
Pusher.secret = '791f84738e2d63437947'    


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
    @item = Item.find(params.require(:item_id))
    clean_params = params.require(:comment).permit(:from, :message)
    @comment = @item.comments.new(clean_params)
    if @comment.save
        push_count(@item.id, @item.comments.count)
        redirect_to @item, notice: 'Item was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
  end

  private

  def push_count(item_id, count)
    Pusher.trigger('formdemo_channel', 
      'comment_event', {item_id: item_id, count: count})
  end
end
