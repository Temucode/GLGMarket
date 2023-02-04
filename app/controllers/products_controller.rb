class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :show, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
   #@product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @user = current_user
    @product.user_id = @user.id
    @product.save
    redirect_to products_path(@products)
  end

  def edit
    # @product = Product.find(params[:id])
  end

  def update
    # @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    # @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, status: :see_other
  end

  def my_products
    @my_product = current_user.products.all
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :address, :price, :user_id, images: [])
  end
end
