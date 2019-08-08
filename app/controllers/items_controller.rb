class ItemsController < ApplicationController

  def index
  end

  def show
  end

  def sell
  end

  def edit_item
  end

  def buy_confirm
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to controller: 'mypage', action: 'list'
  end

  def my_item
    @items = Item.find(params[:id])
  end

end
