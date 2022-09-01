class ProductsController < ApplicationController

  before_action :set_product, only: %i[edit update destroy]

  def index
      @products = Product.all.order(id: 'DESC')
  end

  def show; end

  def edit; end

  def update
    if @product.update(form_params)
      redirect_to products_path
    else
      redirect :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
  end

  private

  def form_params
      params.require(:product)
  end

  def set_product
      @product = Product.find(params[:id])
  end

end
