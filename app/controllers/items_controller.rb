class ItemsController < ApplicationController
  before_action :set_item, only: [:destroy, :my_item]

  def index
    
  end

  def show
    @items = Item.where(id: params[:id])
    @item = Item.find(params[:id])
    # @item_images = ItemImage.all
  end

  def new
    @item = Item.new
    @parents = Category.where(ancestry: nil) #Category.where(ancestry = ?, "nil")
    @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
    @parents = Category.where(ancestry: nil)
    if @item.save && new_image_params[:images][0] != ""
      new_image_params[:images].each do |image|
        @item.item_images.create(image: image, item_id: @item.id)
      end
      redirect_to root_path
    else
      @item.item_images.build
      render :new
    end
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

  def edit_item
  end

  def buy_confirm
  end

  private

  def item_params
    params.require(:item).permit(:name, :explain, :category_id, :status, :delivery_cost, :delivery_way, :delivery_prefecture, :delivery_date, :price).merge(seller_id: 1)
  end

  def new_image_params
    params.require(:new_images).permit({images: []})
  end
  
  def destroy
    @item.destroy
    redirect_to controller: 'mypage', action: 'list'
  end

  def my_item
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
