class PurchaseController < ApplicationController
  def new
    @product = Product.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "users", action: "card_create"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @credit = customer.cards.retrieve(card.card_id)
    end
  end
  def pay
    product = Product.find(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    Payjp::Charge.create(
      :amount => product.price, #支払金額を入力（itemテーブル等に紐づけても良い）
      :customer => card.customer_id, #顧客ID
      :currency => 'jpy', #日本円
      )
    product.update(sell_status_id: 3)
    if product.save!
    redirect_to action: 'done' #完了画面に移動
    else
      redirect_to action: 'new'
    end

    def done
    end
  end
end
