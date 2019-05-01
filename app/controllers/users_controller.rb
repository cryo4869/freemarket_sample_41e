class UsersController < ApplicationController

  def signup
  end

  def show
    @products = Product.order("created_at ASC")
  end

  def mypage

  end

  def card_create

  end

  def add_card
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      customer = Payjp::Customer.create(card: params['payjpToken'])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "mypage"
      else
        redirect_to action: "payment_method"
      end
    end
end
