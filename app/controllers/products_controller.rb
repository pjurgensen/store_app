class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product), notice: "Product Saved"
    else
      render 'new', notice: "Invalid Entry. Please try again."
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product), notice: "Product Updated"
    else
      render 'edit', notice: "Invalid Entry. Please try again."
    end
  end

private

  def product_params
    params.require(:product).permit(:name,
                                    :description,
                                    :price)
  end
end
