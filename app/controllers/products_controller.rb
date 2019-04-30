class ProductsController < ApplicationController
  def index
    @products = Product.order("created_at ASC").where.not(sell_status_id:3).limit(4)
    @search = Product.ransack(params[:q])
    @result = @search.result
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.order("created_at ASC").limit(3)
  end

  def new
    @sell = Product.new
    @shipping_method = ShippingMethod.new
    @categories = Category.eager_load(children: :children).where(parent_id: nil)
    @image = Image.new
  end

  def create
    @sell = current_user.products.new(sell_params)
    if @sell.save! & save_images(@sell, image_params)
      redirect_to product_path(@sell)
    else
      redirect_to root_path
    end
  end

  def edit
     @sell = Product.find(params[:id])
     @image = @sell.images
  end

  def update
    @sell = Product.find(params[:id])
    if @sell.update(sell_params)
      redirect_to product_path(@sell)
    else
      redirect_to root_path
    end
  end

  def status
    @sell = Product.find(params[:id])
    if @sell.update(sell_status_id: 2)
      redirect_to product_path(@sell)
    else
      redirect_to root_path
    end
  end

  def search
  @search = Product.ransack(params[:q])
  @result = @search.result
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
                                    :size_id, :category_id, :shipping_from,:sell_status_id ,:brand,user_id:current_user.id)
  end

  def search_params
    params.require(:q).permit!
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
