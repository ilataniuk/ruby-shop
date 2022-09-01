class OrdersController < ApplicationController

  def index

  end

  def basket
      @order = current_order;
  end
end
