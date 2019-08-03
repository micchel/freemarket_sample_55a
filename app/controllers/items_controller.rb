class ItemsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @item = Item.new
    @parents = Category.where(ancestry: nil) #Category.where(ancestry = ?, "nil")
    @item.item_images.build
  end

  def select
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @children = Category.find(params[:parent_id]).children
        else
          @grand_children = Category.find(params[:child_id]).children
        end
      end
    end
  end

  def select_grand
    respond_to do |format|
      format.html
      format.json { @grand_children_info = Category.find(params[:grand_id]) }
    end
  end

  def create
  end

  def edit_item
  end

  def buy_confirm
  end
end
