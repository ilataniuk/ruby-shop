class OrderItemsController < ApplicationController
  before_action :set_product, only: %i[create update destroy]
  before_action :set_order, only: %i[index]

  def create
    if @order_item
      @order_item.increment(:cnt)
    else
      @order_item = current_order.order_items.create(product_id: params[:product_id])
    end
    # duplicating... may name or price in products will have changed after order creating
    @order_item.name = @order_item.product.name
    @order_item.price = @order_item.product.price

    @order_item.save

    flash.notice = "#{@order_item.cnt} x #{@order_item.product.name} added to basket successfully"

    redirect_to root_path
  end

  def update
    @order_item.cnt += params[:cnt].to_i;
    @order_item.cnt = 1 if @order_item.cnt < 1
    @order_item.save
    redirect_to basket_path, status: :see_other
  end

  def destroy
    @order_item.destroy
    redirect_to basket_path, status: :see_other
  end

  def index; end

  private

  def set_product
    @order_item = current_order.order_items.find_by(product: params[:product_id])
  end

  def set_order
    @order_items = current_order.order_items.order(id: 'ASC')
  end

end
