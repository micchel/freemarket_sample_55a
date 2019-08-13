class PurchaseController < ApplicationController

    require 'payjp'

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => 13500,
    :customer => card.customer_id,
    :currency => 'jpy',
  )
  item.update(buyer_id: currnet.user.id)
  redirect_to action: 'done'
  end

  def done
  end
end
