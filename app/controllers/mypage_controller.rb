class MypageController < ApplicationController

  def index
  end

  def profile
  end

  def card
  end

  def information
  end

  def logout
  end

  def list
    @items = current_user.items.where(buyer_id: nil)
  end

  def edit
  end
end
