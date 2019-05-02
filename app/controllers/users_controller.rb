class UsersController < ApplicationController

  def signup
  end

  def show
    @user = User.find(params[:id])
    @products = Product.order("created_at ASC")
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def mypage
    @products = Product.order("created_at ASC")
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

  private
  def user_params
    params.require(:user).permit(:nickname, :profile)
  end

end
