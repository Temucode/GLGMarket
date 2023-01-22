class MyProductsController < ApplicationController
  def new
    @product = Product.find(params[:dessin_id])
    @my_product = My_product.new
  end

  def create
    @my_product = My_product.new(my_product_params)
    @product = Product.find(params[:product_id])
    @my_product.product = @product
    if @my_product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @my_product = My_product.find(params[:id])
    @my_product.destroy
    redirect_to product_path(@my_product.product), status: :see_other
  end

  private

  def my_product_params
    params.require(:my_product).permit(:content)
  end
end
