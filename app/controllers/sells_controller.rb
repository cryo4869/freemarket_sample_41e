class SellsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @sell = Product.new
    @shipping_method = ShippingMethod.new
    @categories = Category.eager_load(children: :children).where(parent_id: nil)
    @image = Image.new
  end

  def create
    @sell = Product.new(sell_params)

    if @sell.save! & save_images(@sell, image_params)
      redirect_to sell_path(@sell)
    else
      redirect_to root_path
    end
  end

  def shipping_method
    @sell = Product.new
    render partial: 'sells/shipping_method', locals: { delivery_fee_owner_id: params[:delivery_fee_owner_id] }
  end

  def category_middle
    @categories = Category.roots.find(params[:parent_id])
  end
  def category_bottom
    @categories = Category.roots.find(params[:top_id]).children.find(params[:parent_id])
  end
  private

  def sell_params
    params.require(:product).permit(:delivery_fee_owner_id, :shipping_method_id,:delivery_date_id, :name, :info, :price, :status,
    :size_id, :category_id, :shipping_from, :brand)
  end

  def image_params
    params.require(:images).require(:image).permit(params[:images][:image].keys) if params[:images].present?
  end

  def save_images(item, images)
    if images.present?
      return false if item.id.blank?
      images.values.each do |name|
        @image = item.images.create(image: name)
      end
    else
      @image_error = "画像がありません"
      return false
    end
  end
end
