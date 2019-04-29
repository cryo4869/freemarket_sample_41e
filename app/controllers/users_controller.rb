class UsersController < ApplicationController

  def signup
  end

  def show
    @products = Product.order("created_at ASC")
  end

  def payment_method

  end
  def pay
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    if params['payjp_token'].blank?
      redirect_to action: "payment_method"
    else
      customer = Payjp::Customer.create(card: params['payjp_token'])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "payment_method"
      end
    end
  end
end
