class UsersController < ApplicationController
  def signup
  end

  def show
    @products = Product.order("created_at ASC")
  end

  def payment_method

  end
  def pay
    Payjp.api_key = 'sk_test_cfc354b6aa7a9d29b10bf702'
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(card: params['payjp-token'])
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "payment_method"
      end
    end
  end
end
