class BuysController < ApplicationController

  def index

  end
  def show
    @product = Product.find(params[:id])
    @products = Product.order("created_at ASC").limit(3)
  end

  def new

  end
  def create

  end
  def edit

  end

  def update

  end
  def destroy

  end
end
