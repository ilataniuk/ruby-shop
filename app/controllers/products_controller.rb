class ProductsController < ApplicationController
  def index

  end

  def show
      Product.find_by(id: params[:id])
  end
end
