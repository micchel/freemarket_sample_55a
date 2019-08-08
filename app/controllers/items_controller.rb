class ItemsController < ApplicationController
  before_action :set_item, only: [:destroy, :my_item]

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
    @item.destroy
    redirect_to controller: 'mypage', action: 'list'
  end

  def my_item
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
