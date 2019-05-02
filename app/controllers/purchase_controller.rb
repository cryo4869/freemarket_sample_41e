class PurchaseController < ApplicationController
  before_action :authenticate_user!, only: :new
  def new
    @product = Product.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "users", action: "card_create"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @credit = customer.cards.retrieve(card.card_id)
    end
  end
  def pay
    product = Product.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    Payjp::Charge.create(
      :amount => product.price,
      :customer => card.customer_id,
      :currency => 'jpy',
      )
    product.update(sell_status_id: 3)
    if product.save!
    redirect_to action: 'done'
    else
      redirect_to action: 'new'
    end
    def done
        
    end
  end
end
